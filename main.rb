# require 'sinatra'
require_relative 'classes/generator_factory'
require 'resolv'

login_generator = GeneratorFactory.build(:login, 'bohdan', 'kutkovy')
logins = login_generator.generate

domain_generator = GeneratorFactory.build(:domain, 'ralabs')
p domains = domain_generator.generate

