require_relative 'generator'
require_relative 'domain_zones'

class Domain < Generator
  attr_reader :dm

  def initialize(dm)
    @dm = dm
    @domain_zones = DomainZones.get
  end

  def generate
  end
end