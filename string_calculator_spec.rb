# string_calculator_spec.rb
require_relative './string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns number for single number input' do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it 'returns sum of two numbers' do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it 'handles newlines as delimiters' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports custom delimiter like //;\n1;2' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'ignores numbers greater than 1000' do
      expect(StringCalculator.add("2,1001")).to eq(2)
    end

    it 'supports delimiters of any length like //[***]\n1***2***3' do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'supports multiple delimiters like //[***][%%]\n1***2%%3' do
      expect(StringCalculator.add("//[***][%%]\n1***2%%3")).to eq(6)
    end
  end
end
