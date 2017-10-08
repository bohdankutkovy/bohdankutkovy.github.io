require_relative '../spec_helper'

RSpec.describe Login  do

  context 'CONSTANTS' do
    it 'should return SYMBOLS constant' do
      expect(Login::SYMBOLS).to eql(%W[. _ - # #{""}])
    end
  end

  context 'instance fields' do
    it 'should return reader attrs of instance' do
      fn, ln = 'ab', 'cd'
      login_instance = GeneratorType.build(:login, fn, ln)
      expect(login_instance.fn).to eql(fn)
      expect(login_instance.ln).to eql(ln)
    end
  end

  context 'instance methods' do
    it 'should return generated logins' do
      fn, ln = 'ab', 'cd'
      login_instance = GeneratorType.build(:login, fn, ln)
      expect(login_instance.generate).to match_array(['ab', 'cd', 'a.c', 'c.a', 'a.cd', 'cd.a', 'ab.c', 'c.ab', 'ab.cd', 'cd.ab', 'a_c', 'c_a', 'a_cd', 'cd_a', 'ab_c', 'c_ab', 'ab_cd', 'cd_ab', 'a-c', 'c-a', 'a-cd', 'cd-a', 'ab-c', 'c-ab', 'ab-cd', 'cd-ab', 'a#c', 'c#a', 'a#cd', 'cd#a', 'ab#c', 'c#ab', 'ab#cd', 'cd#ab', 'ac', 'ca', 'acd', 'cda', 'abc', 'cab', 'abcd', 'cdab'])
    end

    context 'private methods' do
      it 'returns string parts' do
        fn, ln = 'ab', 'cd'
        login_instance = GeneratorType.build(:login, fn, ln)
        expect(login_instance.send(:get_string_parts, fn)).to match_array(['a', 'ab'])
      end

      it 'returns string permutations' do
        fn, ln, symbol = 'ab', 'cd', '.'
        login_instance = GeneratorType.build(:login, fn, ln)
        expect(login_instance.send(:permutate_strings, symbol, fn, ln)).to match_array(['ab.cd', 'cd.ab'])
      end
    end
  end

end