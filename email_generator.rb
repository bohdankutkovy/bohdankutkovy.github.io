class EmailGenerator < Sinatra::Base
  set :haml, format: :html5

  get "/" do
    haml :index
  end

  post "/emails" do
    content_type :json
    if !params[:firstname].empty? && !params[:lastname].empty? && !params[:domain].empty?
      login_generator = GeneratorType.build(:login, params[:firstname], params[:lastname])
      logins = login_generator.generate

      domain_generator = GeneratorType.build(:domain, params[:domain])
      domains = domain_generator.generate

      email_generator = GeneratorType.build(:email, logins, domains)
      emails = email_generator.generate
      {emails: emails.join("\n")}.to_json
    else
      { error: "Parameters missing!" }.to_json
    end
  end

end


