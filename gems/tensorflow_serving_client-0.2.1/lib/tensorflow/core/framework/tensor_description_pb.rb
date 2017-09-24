# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: tensorflow/core/framework/tensor_description.proto

require 'google/protobuf'

require 'tensorflow/core/framework/types_pb'
require 'tensorflow/core/framework/tensor_shape_pb'
require 'tensorflow/core/framework/allocation_description_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "tensorflow.TensorDescription" do
    optional :dtype, :enum, 1, "tensorflow.DataType"
    optional :shape, :message, 2, "tensorflow.TensorShapeProto"
    optional :allocation_description, :message, 4, "tensorflow.AllocationDescription"
  end
end

module Tensorflow
  TensorDescription = Google::Protobuf::DescriptorPool.generated_pool.lookup("tensorflow.TensorDescription").msgclass
end
