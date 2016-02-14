# spec/spec_helper.rb
require 'rack/test'
require 'rspec'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../config/environment.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods
end

def app() Sinatra::Application end

RSpec.configure do |c|
  c.include RSpecMixin
end
