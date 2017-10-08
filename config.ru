require 'rubygems'
require 'bundler'

require 'thread'

require 'singleton'
require 'yaml'

require 'resolv'

Dir["./classes/*.rb"].each {|file| require file }

Bundler.require

require './email_generator'
run EmailGenerator
