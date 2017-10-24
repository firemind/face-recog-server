class EmbeddingClient
  def initialize
    @base_url = "http://localhost:5001/"
  end
  
  def embed(image)
    resp = RestClient.post(@base_url+"embed", {
        images: image
    })
    JSON.parse(resp.body)["embedding"][0]
  end

  def embed_multi(images)
    resp = RestClient.post(@base_url+"embed", {
        images: images
    })
    JSON.parse(resp.body)["embedding"]
  end

end
