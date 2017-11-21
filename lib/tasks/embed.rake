task embed: :environment do
  trackings = Tracking.all
  emb_client = EmbeddingClient.new

  border_ratio = (182.0/44) / (160.0/32)
  data = trackings.each do |t|
    img = Magick::Image.read(t.image.path)[0]
    desired_size = 160
    #ratio =  [t.height, t.width].min.to_f / desired_size.to_f
    # if t.width != t.height
    #   raise "bad dims #{t.inspect}"
    # end

    begin
      img = img.crop(t.left+(t.width*(1-border_ratio)/2), t.top+(t.height*(1-border_ratio)/2), t.width*border_ratio, t.height*border_ratio).adaptive_resize(desired_size, desired_size)
      img.write("test.jpg")
      img = File.new("test.jpg")
      emb = emb_client.embed(img)
      t.emb = emb
      t.save!
    rescue
      p t
    end
  end

end
