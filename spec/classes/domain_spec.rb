require_relative '../spec_helper'

RSpec.describe Domain  do

  context 'CONSTANTS' do
    it 'should return THREAD_COUNT constant' do
      expect(Domain::THREAD_COUNT).to eql(16)
    end
  end

  context 'instance fields' do
    it 'should return reader attrs of instance' do
      dm = 'google'
      dm_up = 'Google'
      domain_instance = GeneratorType.build(:domain, dm)
      expect(domain_instance.dm).to eql(dm)
      domain_instance = GeneratorType.build(:domain, dm_up)
      expect(domain_instance.dm).to eql(dm)
    end
  end

  context 'instance methods' do
    it 'should return generated domains' do
      dm = 'ralabs'
      domain_instance = GeneratorType.build(:domain, dm)
      domains = domain_instance.generate
      expect(domains).to eql(domains)
    end

    context 'private methods' do
      it 'gets full domains' do
        dm = 'ralabs'
        domain_instance = GeneratorType.build(:domain, dm)
        result = domain_instance.send(:get_full_domains)
        expect(result).to eql(result)
      end

    end
  end

end