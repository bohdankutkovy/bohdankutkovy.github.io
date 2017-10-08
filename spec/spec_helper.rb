require 'rack/test'
require 'rspec'
require 'sinatra'
require 'thread'
require 'singleton'
require 'yaml'
require 'resolv'

require_relative '../classes/generator_type.rb'
require_relative '../classes/generator.rb'
require_relative '../classes/domain_zones.rb'
require_relative '../classes/login.rb'
require_relative '../classes/domain.rb'
require_relative '../classes/email.rb'
require_relative '../email_generator.rb'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods

  def app
    described_class
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
end