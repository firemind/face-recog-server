require 'fileutils'
class ApiController < ApplicationController
  ALIGNED_PATH = "images/aligned"
  CLASSIFY_ALIGNED_PATH = "tmp/aligned_images/"
  RAW_PATH = "tmp/raw_images/"
  def store
    raise "Unknown label #{params.inspect}" if params[:label].blank?
    label_name = params[:label].gsub(/(\W|\d)/, "")
    base_path = File.join(RAW_PATH, label_name)
    FileUtils.mkdir_p base_path
    file_count = Dir.glob(File.join(base_path, '**', '*')).select { |file| File.file?(file) }.count
    file_path = File.join(base_path, "#{label_name}_#{'%04i' % (file_count+1)}.jpg")
    clean_dir RAW_PATH
    `mv #{params[:image].path} #{file_path}`
    FileUtils.mkdir_p ALIGNED_PATH
    puts `bin/align.sh #{RAW_PATH} #{ALIGNED_PATH}`
    aligned_path = File.join(ALIGNED_PATH, "#{label_name}", "#{label_name}_#{'%04i' % (file_count+1)}.png")
    if File.exists? aligned_path
      render plain: "stored as #{aligned_path}"
    else
      raise "Error storing in  #{aligned_path}"
    end
  end

  def classify
    clean_dir RAW_PATH
    base_path = File.join(RAW_PATH, "sample")
    FileUtils.mkdir_p base_path
    file_path = File.join(base_path, "sample.jpg")
    `mv #{params[:image].path} #{file_path}`
    puts "mv #{params[:image].path} #{file_path}"
    clean_dir CLASSIFY_ALIGNED_PATH
    puts `bin/align.sh #{RAW_PATH} #{CLASSIFY_ALIGNED_PATH}`
    aligned_path = File.join(CLASSIFY_ALIGNED_PATH, "sample", "sample.png")
    if File.exists? aligned_path
      cmd = "bin/predict.sh #{aligned_path}"
      puts cmd
      prediction= `#{cmd}`
      puts prediction
      render plain: prediction.chomp.split("\n").last
    else
      raise "Error aligning #{aligned_path}"
    end
  end

  def test
    sleep 1
    render plain: "done"
  end

  private
  
  def clean_dir(dir)
    FileUtils.remove_dir dir if File.exists? dir
    FileUtils.mkdir_p dir
  end


end
