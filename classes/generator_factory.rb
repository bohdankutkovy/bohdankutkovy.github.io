require_relative 'login'
require_relative 'domain'

class GeneratorFactory
  def self.build(type, *args)
    case type
    when :login
      Login.new(*args)
    when :domain
      Domain.new(*args)
    end
  end
end
