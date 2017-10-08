require_relative '../spec_helper'

RSpec.describe EmailGenerator  do

  context 'instance methods' do
    it 'shoud visit /' do
      get '/'
      expect(last_response).to be_ok
    end

    it 'should post to /emails' do
      post '/emails', params={ firstname: 'ab', lastname: 'cd', domain: 'google' }
      expect(last_response).to be_ok
    end

    it 'should post to /emails with empty params' do
      post '/emails', params={ firstname: '', lastname: 'cd', domain: 'google' }
      expect(JSON.parse(last_response.body)).to eq({"error" => "Parameters missing!"})
    end

  end

end