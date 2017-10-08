require 'rubygems'
require 'bundler'

require 'net/dns'
require 'thread'

require 'singleton'
require 'yaml'

Dir["./classes/*.rb"].each {|file| require file }

Bundler.require

require './email_generator'
run EmailGenerator
