# require 'resolv'
require 'rubygems'
require 'net/dns'

require_relative 'generator'
require_relative 'domain_zones'

class Domain < Generator
  attr_reader :dm

  def initialize(dm)
    @dm = dm
    @domain_zones = DomainZones.get
  end

  def generate
    get_full_domains.delete_if{ |domain| !is_dm_available?(domain) }
  end

  private

  def get_full_domains
    @domain_zones.map{ |dz| @dm + dz }
  end

  def is_dm_available?(domain)
    Net::DNS::Resolver.start(domain, Net::DNS::MX).answer.size > 0
  end
end