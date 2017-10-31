task embed_celebs: :environment do
  ec = EmbeddingClient.new
  CelebSample.find_in_batches(batch_size: 100).each do |samples|
    embeddings = ec.embed_multi(samples.map{|r| File.new(r.image.path,'rb')})
    samples.each_with_index do |s,i|
      s.emb = Marshal.dump embeddings[i]
      s.save!
    end
  end
end
