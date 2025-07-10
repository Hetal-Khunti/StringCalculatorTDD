# string_calculator.rb
class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiters = [",", "\n"]
    custom_delimiter_section = ""

    if numbers.start_with?("//")
      custom_delimiter_section, numbers = numbers.split("\n", 2)
      custom_delimiters = custom_delimiter_section[2..]

      if custom_delimiters.start_with?("[")
        delimiters += custom_delimiters.scan(/\[([^\]]+)\]/).flatten
      else
        delimiters << custom_delimiters
      end
    end

    regex = Regexp.union(delimiters)
    nums = numbers.split(regex).map(&:to_i)

    negatives = nums.select { |n| n < 0 }
    raise "Negatives not allowed: #{negatives.join(", ")}" unless negatives.empty?

    nums.select { |n| n <= 1000 }.sum
  end
end

