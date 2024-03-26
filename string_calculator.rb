class StringCalculator
  @add_count = 0

  def self.add(numbers)
    @add_count += 1

    return 0 if numbers.empty?

    numbers_array = get_numbers(numbers)

    negatives = numbers_array.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers_array.reject! { |num| num > 1000 }

    numbers_array.sum
  end

  def self.get_numbers(numbers)
    numbers_array = numbers.start_with?("//") ? change_delimiter(numbers) : numbers.split(/,|\n/)
    numbers_array.map(&:to_i)
  end

  def self.GetCalledCount
    @add_count
  end

  def self.change_delimiter(numbers)
    delimiter, numbers = numbers.split("\n", 2)
    delimiter = delimiter[2..-1]

    delimiter.gsub!(/\[|\]/, '') if delimiter.start_with?('[')
    numbers.split(delimiter)
  end
end
