class EmailGeneratorsController < Sinatra::Base
  get "/" do
    login_generator = GeneratorType.build(:login, 'bohdan', 'kutkovy')
    logins = login_generator.generate

    domain_generator = GeneratorType.build(:domain, 'ralabs')
    domains = domain_generator.generate

    email_generator = GeneratorType.build(:email, logins, domains)
    emails = email_generator.generate
    emails
  end
end


