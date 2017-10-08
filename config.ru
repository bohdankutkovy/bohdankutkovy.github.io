require 'rubygems'
require 'bundler'

require 'net/dns'
require 'thread'

require 'singleton'
require 'yaml'

Dir["./classes/*.rb"].each {|file| require file }

Bundler.require

require './controllers/email_generators_controller'
run EmailGeneratorsController
