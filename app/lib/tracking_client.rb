class TrackingClient
  def initialize
    @base_url = Rails.configuration.x.tracking_server
  end
  
  def track(id, embedding)
    track_batch([id], [embedding])[0]
  end

  def track_batch(ids, embeddings)
    resp = RestClient.post(@base_url+"track", {
        ids: ids,
        embeddings: embeddings
    }.to_json, {content_type: :json, accept: :json})

    JSON.parse(resp.body)["labels"]
  end
  
  def reset
    resp = RestClient.post(@base_url+"reset", {
    }.to_json, {content_type: :json, accept: :json})
  end
end
