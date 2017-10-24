task train_celebs: :environment do
  ec = Embeddingclient.new
  CelebSample.find_in_batches(batch_size: 100).each do |samples|
    embeddings = ec.embed_multi(samples.map &:image)
  end
end
