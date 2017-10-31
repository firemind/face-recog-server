task verify_celebs: :environment do
  client = FaceMindClient.new
  percentages = []
  Celeb.all.each do |c|
    puts c.name
    correct = 0
    c.samples.sample(5).each do |s|
      pred = client.classify(Marshal.load(s.emb))
      if pred[0] == c.id
        correct += 1
      else
        puts c.id
        p pred
      end
    end
    puts "#{correct}/5"
    percentages << correct.to_f/5
  end
  puts percentages.inject(0.0) { |sum, el| sum + el } / percentages.size
end
