class EmbeddingClient
  def initialize
    @base_url = "http://localhost:5001/"
  end
  
  def embed(image)
    params = {images: [image]}
    resp = RestClient.post(@base_url+"embed", params)
    JSON.parse(resp.body)["embedding"][0]
  end

  def embed_multi(images)
    params = {images: images}
    resp = RestClient.post(@base_url+"embed", params)
    JSON.parse(resp.body)["embedding"]
  end

end
