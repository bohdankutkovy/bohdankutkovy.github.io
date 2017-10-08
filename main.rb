# require 'sinatra'
require_relative 'classes/generator_factory'

login_generator = GeneratorFactory.build(:login, 'bohdan', 'kutkovy')
logins = login_generator.generate