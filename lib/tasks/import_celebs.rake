task import_celebs: :environment do
  base_dir = "/media/mike/HD/mscelebs-cropped-5/"
  Dir.foreach(base_dir) do |celeb|
    next if celeb == '.' or celeb == '..'
    celeb = Celeb.where(name: celeb).first_or_create!
    Dir.foreach(base_dir+"/"+celeb) do |sample|
      unless celeb.samples.where(image_name: sample).first
        celeb.samples.create(image: File.new(File.join(base_dir, celeb, sample)))
      end
    end
  end
end
