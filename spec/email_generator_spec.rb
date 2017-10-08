require_relative 'spec_helper.rb'
require_relative '../email_generator.rb'

RSpec.describe EmailGenerator  do

  it 'should greet' do
    get '/'
    expect(last_response).to be_ok
  end
end