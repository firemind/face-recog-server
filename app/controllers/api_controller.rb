require 'fileutils'
class ApiController < ApplicationController
  ALIGNED_PATH = "images/aligned"
  CLASSIFY_ALIGNED_PATH = "tmp/aligned_images/"
  RAW_PATH = "tmp/raw_images/"
  def store
    if params[:image] && params[:label]
      ec = EmbeddingClient.new
      emb = ec.embed(params[:image])
      fmc = FaceMindClient.new
      celeb = Celeb.where(name: params[:label]).first_or_create!
      celeb.samples.create(image: params[:image])
      fmc.store(celeb.id, emb)
      fmc.train()
      render json: {
          image: celeb.samples.first.image.url
      }
    else
      render error: "No image given"
    end
  end

  def classify
    if params[:image]
      ec = EmbeddingClient.new
      emb = ec.embed(params[:image])
      fmc = FaceMindClient.new
      label, score = fmc.classify(emb)
      celeb = Celeb.find(label)
      render json: {
          label: celeb.to_s,
          score: score,
          image: celeb.samples.first.image.url
      }
    else
      render error: "No image given"
    end
  end

  def track
    if params[:image]
      meta = JSON.parse(params[:data])
      puts meta
      embs = meta['embeddings']
      unless embs
        puts "No Embedding sent"
        ec = EmbeddingClient.new
        embs = [ec.embed(params[:image])]
      end
      location = Location.where(name: meta["location"]).first_or_create!
      trackings = []
      meta['positions'].each_with_index do |pos, ix|
        puts pos.inspect
        Tracking.transaction do
          tracking = Tracking.create(
              location: location,
              image: params[:image],
              width:  pos['width'],
              height: pos['height'],
              left:   pos['left'],
              top:    pos['top']
          )
          tc = TrackingClient.new
          label = tc.track(tracking.id, embs[ix])
          tracking.label = label
          puts tracking.inspect
          tracking.save!
          trackings << tracking
        end
      end
      render json: {
          label: trackings.map(&:label),
          history_url: trackings.map{|t| history_url(t.label)},
          location_url: current_location_url(location),
      }
    else
      render error: "No image given"
    end
  end

  private
  
  def clean_dir(dir)
    FileUtils.remove_dir dir if File.exists? dir
    FileUtils.mkdir_p dir
  end


end
