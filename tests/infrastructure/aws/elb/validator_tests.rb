require "minitest/spec"
require "minitest/autorun"
require 'mocha/minitest'

require "./src/infrastructure/aws/elb/validator"

describe "Infrastructure::Aws::Elb::Validator" do
  let(:resources) { [] }
  let(:listener_validator) { m = mock(); m.stubs(:execute); m }
  let(:max_listeners) { 10 }
  let(:validator) { Infrastructure::Aws::Elb::Validator.new(max_listeners, listener_validator) }

  it "should create validator" do
    validator.wont_be_nil
  end

  it "should invoke type validator factory" do
    listener_validator.expects(:execute)
    validator.execute(resources)
  end
end