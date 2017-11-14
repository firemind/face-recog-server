class TrackingClient
  def initialize
    @base_url = Rails.configuration.x.tracking_server
  end
  
  def track(id, embedding)
    resp = RestClient.post(@base_url+"track", {
        id: id,
        embedding: embedding
    }.to_json, {content_type: :json, accept: :json})

    JSON.parse(resp.body)["label"]
  end
  
  def reset
    resp = RestClient.post(@base_url+"reset", {
    }.to_json, {content_type: :json, accept: :json})
  end
end
