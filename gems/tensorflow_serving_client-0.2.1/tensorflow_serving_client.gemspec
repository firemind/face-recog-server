# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tensorflow_serving_client/version'

Gem::Specification.new do |spec|
  spec.name          = "tensorflow_serving_client"
  spec.version       = TensorflowServingClient::VERSION
  spec.authors       = ["Dominique d’Argent"]
  spec.email         = ["dominique.dargent@me.com"]

  spec.summary       = %q{A Ruby client library for Tensorflow Serving}
  spec.homepage      = "https://github.com/nubbel/tensorflow_serving_client-ruby"
  spec.license       = "MIT"

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  spec.files         = %w(
.gitignore
.gitmodules
.rspec
.travis.yml
Gemfile
LICENSE.txt
README.md
Rakefile
bin/console
bin/setup
lib/tensorflow/core/example/example_parser_configuration_pb.rb
lib/tensorflow/core/example/example_pb.rb
lib/tensorflow/core/example/feature_pb.rb
lib/tensorflow/core/framework/allocation_description_pb.rb
lib/tensorflow/core/framework/attr_value_pb.rb
lib/tensorflow/core/framework/cost_graph_pb.rb
lib/tensorflow/core/framework/device_attributes_pb.rb
lib/tensorflow/core/framework/function_pb.rb
lib/tensorflow/core/framework/graph_pb.rb
lib/tensorflow/core/framework/kernel_def_pb.rb
lib/tensorflow/core/framework/log_memory_pb.rb
lib/tensorflow/core/framework/node_def_pb.rb
lib/tensorflow/core/framework/op_def_pb.rb
lib/tensorflow/core/framework/resource_handle_pb.rb
lib/tensorflow/core/framework/step_stats_pb.rb
lib/tensorflow/core/framework/summary_pb.rb
lib/tensorflow/core/framework/tensor_description_pb.rb
lib/tensorflow/core/framework/tensor_pb.rb
lib/tensorflow/core/framework/tensor_shape_pb.rb
lib/tensorflow/core/framework/tensor_slice_pb.rb
lib/tensorflow/core/framework/types_pb.rb
lib/tensorflow/core/framework/variable_pb.rb
lib/tensorflow/core/framework/versions_pb.rb
lib/tensorflow/core/protobuf/config_pb.rb
lib/tensorflow/core/protobuf/control_flow_pb.rb
lib/tensorflow/core/protobuf/master_pb.rb
lib/tensorflow/core/protobuf/master_service_pb.rb
lib/tensorflow/core/protobuf/master_service_services_pb.rb
lib/tensorflow/core/protobuf/meta_graph_pb.rb
lib/tensorflow/core/protobuf/named_tensor_pb.rb
lib/tensorflow/core/protobuf/queue_runner_pb.rb
lib/tensorflow/core/protobuf/saved_model_pb.rb
lib/tensorflow/core/protobuf/saver_pb.rb
lib/tensorflow/core/protobuf/tensor_bundle_pb.rb
lib/tensorflow/core/protobuf/tensorflow_server_pb.rb
lib/tensorflow/core/protobuf/worker_pb.rb
lib/tensorflow/core/protobuf/worker_service_pb.rb
lib/tensorflow/core/protobuf/worker_service_services_pb.rb
lib/tensorflow_serving/apis/classification_pb.rb
lib/tensorflow_serving/apis/get_model_metadata_pb.rb
lib/tensorflow_serving/apis/inference_pb.rb
lib/tensorflow_serving/apis/input_pb.rb
lib/tensorflow_serving/apis/model_pb.rb
lib/tensorflow_serving/apis/predict_pb.rb
lib/tensorflow_serving/apis/prediction_service_pb.rb
lib/tensorflow_serving/apis/prediction_service_services_pb.rb
lib/tensorflow_serving/apis/regression_pb.rb
lib/tensorflow_serving_client.rb
lib/tensorflow_serving_client/version.rb
tensorflow_serving_client.gemspec
).reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'grpc', '~> 1.0', '>= 1.0.1'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'grpc-tools', '~> 1.0', '>= 1.0.1'
end
