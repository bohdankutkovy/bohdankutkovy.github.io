class GeneratorType
  def self.build(type, *args)
    case type
    when :login
      Login.new(*args)
    when :domain
      Domain.new(*args)
    when :email
      Email.new(*args)
    end
  end
end
