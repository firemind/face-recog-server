task fit_celebs: :environment do
  client = FaceMindClient.new
  client.reset()
  Celeb.all.each do |c|
    puts c.name
    c.samples.first(10).each do |s|
      client.store(c.id, Marshal.load(s.emb))
    end
  end
  client.train()
end
