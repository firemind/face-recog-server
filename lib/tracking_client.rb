class TrackingClient
  def initialize
    @base_url = "http://localhost:5002/"
  end
  
  def track(id, embedding)
    resp = RestClient.post(@base_url+"track", {
        id: id,
        embedding: embedding
    }.to_json, {content_type: :json, accept: :json})

    JSON.parse(resp.body)["label"]
  end
end
