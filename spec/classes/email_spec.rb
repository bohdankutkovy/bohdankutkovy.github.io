require_relative '../spec_helper'

RSpec.describe Email  do

  context 'instance methods' do
    it 'should return generated email' do
      login, domain = %w(bohdan.kutkovy), %w(google.com)
      email_instance = GeneratorType.build(:email, login, domain)
      expect(email_instance.generate).to match_array(['bohdan.kutkovy@google.com'])
    end

  end

end