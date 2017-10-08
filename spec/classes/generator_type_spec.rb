require_relative '../spec_helper.rb'

RSpec.describe GeneratorType  do

  context 'should return instance of defined type' do
    it 'should return instance of type :login' do
      expect(GeneratorType.build(:login, 'bohdan', 'kutkovy')).to be_an_instance_of(Login)
    end

    it 'should return instance of type :domain' do
      expect(GeneratorType.build(:login, 'bohdan', 'kutkovy')).to be_an_instance_of(Login)
    end

    it 'should return instance of type :email' do
      expect(GeneratorType.build(:login, 'bohdan', 'kutkovy')).to be_an_instance_of(Login)
    end
  end

end