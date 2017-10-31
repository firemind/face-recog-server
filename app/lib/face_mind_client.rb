class FaceMindClient
  def initialize
    @base_url = Rails.configuration.x.face_mind_server
  end
  
  def store(id, embedding)
    resp = RestClient.post(@base_url+"store", {
        label: id,
        embedding: embedding
    }.to_json, {content_type: :json, accept: :json})
    JSON.parse(resp.body)["label"]
  end

  def classify(embedding)
    resp = RestClient.post(@base_url+"classify", {
        embeddings: [embedding]
    }.to_json, {content_type: :json, accept: :json})
    JSON.parse(resp.body)["result"][0]
  end

  def train
    resp = RestClient.post(@base_url+"train", {
    }.to_json, {content_type: :json, accept: :json})
  end

  def reset
    resp = RestClient.post(@base_url+"reset", {
    }.to_json, {content_type: :json, accept: :json})
  end
end
