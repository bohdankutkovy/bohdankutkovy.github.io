# require 'sinatra'
require_relative 'classes/generator_type'

login_generator = GeneratorType.build(:login, 'bohdan', 'kutkovy')
logins = login_generator.generate

domain_generator = GeneratorType.build(:domain, 'ralabs')
domains = domain_generator.generate


