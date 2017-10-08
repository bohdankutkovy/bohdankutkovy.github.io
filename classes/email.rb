# require 'resolv'
require_relative 'generator'

class Email < Generator

  def initialize(logins, domains)
    @logins = logins
    @domains = domains
  end

  def generate
    
  end
end