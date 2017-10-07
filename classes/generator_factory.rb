require_relative 'login'
require_relative 'domain'

class GeneratorFactory
  def get_generator_of(type)
    case type
    when 'login'  then Login.new
    when 'domain' then Domain.new
    end
  end
end
