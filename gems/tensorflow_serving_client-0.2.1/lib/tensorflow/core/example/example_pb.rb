# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tensorflow/core/example/example.proto

require 'google/protobuf'

require 'tensorflow/core/example/feature_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "tensorflow.Example" do
    optional :features, :message, 1, "tensorflow.Features"
  end
  add_message "tensorflow.SequenceExample" do
    optional :context, :message, 1, "tensorflow.Features"
    optional :feature_lists, :message, 2, "tensorflow.FeatureLists"
  end
end

module Tensorflow
  Example = Google::Protobuf::DescriptorPool.generated_pool.lookup("tensorflow.Example").msgclass
  SequenceExample = Google::Protobuf::DescriptorPool.generated_pool.lookup("tensorflow.SequenceExample").msgclass
end
