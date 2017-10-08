class PermutatedEmail < Generator

  def initialize(logins, domains)
    @logins = logins
    @domains = domains
  end

  def generate
    output = @domains.map do |domain|
      @logins.map{ |login| login + "@" + domain }
    end
    output.flatten
  end
end