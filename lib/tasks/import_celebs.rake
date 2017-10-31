task import_celebs: :environment do
  base_dir = "/media/mike/HD/our_dataset/"
  Dir.foreach(base_dir) do |celeb|
    next if celeb == '.' or celeb == '..'
    celeb = Celeb.where(name: celeb).first_or_create!
    Dir.foreach(File.join(base_dir,celeb.name)) do |sample|
      next if sample == '.' or sample == '..'
      unless celeb.samples.where(image_file_name: sample).first
        p = File.join(base_dir, celeb.name, sample)
        puts p
        celeb.samples.create(image: File.new(p))
      end
    end
  end
end
