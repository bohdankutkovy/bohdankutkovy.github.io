class Domain < Generator
  attr_reader :dm
  THREAD_COUNT = 16

  def initialize(dm)
    @dm = dm
    @domain_zones = DomainZones.get
  end

  def generate
    output_domains = []
    input_domains = get_full_domains
    mutex = Mutex.new

    THREAD_COUNT.times.map {
      Thread.new(input_domains, output_domains) do |input_domains, output_domains|
        while domain = mutex.synchronize { input_domains.pop }
          if is_dm_available?(domain)
            mutex.synchronize { output_domains << domain }
          end
        end
      end
    }.each(&:join)

    output_domains
  end

  private

  def get_full_domains
    # get domains consisted of domain and domain_zone
    @domain_zones.map{ |dz| @dm + dz }
  end

  def is_dm_available?(domain)
    # check if domain is available
    Net::DNS::Resolver.start(domain, Net::DNS::MX).answer.size > 0
  end
end