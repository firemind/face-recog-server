class TfFacenetClient
  def initialize
    setup_config
  end

  def setup_config
    @stub = Tensorflow::Serving::PredictionService::Stub.new(Rails.configuration.x.tfserver, :this_channel_is_insecure) #, :this_channel_is_insecure)
  end

  def query(images)
    res = tfpredict(images)

    return res
  end

  protected 

  def tfpredict(recs)

    req = Tensorflow::Serving::ClassificationRequest.new
    #req.model_spec = Tensorflow::Serving::ModelSpec.new name: 'mnist'
    req.model_spec = Tensorflow::Serving::ModelSpec.new name: 'facenet', signature_name: "serving_default"
    #input_def = Tensorflow::TensorProto.new(float_val: rec.map(&:to_i), tensor_shape: Tensorflow::TensorShapeProto.new(dim: [Tensorflow::TensorShapeProto::Dim.new(size: 1),Tensorflow::TensorShapeProto::Dim.new(size: rec.size)]), dtype: Tensorflow::DataType::DT_FLOAT)

    #p example
    example_list = Tensorflow::Serving::ExampleList.new
    recs.each do |rec|
      list = Tensorflow::Int64List.new(value: rec)
      feature = Tensorflow::Feature.new(int64_list: list)
      #p feature
      features = Tensorflow::Features.new(feature: {"x"=> feature})
      #p features
      example = Tensorflow::Example.new({features: features})
      example_list.examples <<  example 
    end
    #p example_list
    req.input = Tensorflow::Serving::Input.new({example_list: example_list})
    #p req
    res = @stub.classify req
    res.result['classifications'].map do |r|
      scores= r['classes']
      max = scores.max_by{|r| r.score}
      [max['label'], max.score]
    end
  end

end
