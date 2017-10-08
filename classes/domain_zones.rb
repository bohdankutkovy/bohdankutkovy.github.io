class DomainZones
  include Singleton

  def self.get
    domain_zones_file = File.expand_path('domain_zones.yml')
    domain_zones = YAML.load_file(domain_zones_file)['domain_zones']
  end
end