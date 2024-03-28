class StringCalculator
  @add_count = 0

  def self.add(numbers)
    @add_count += 1

    return 0 if numbers.empty?

    numbers_array = get_numbers(numbers)
  end

  def self.get_numbers(numbers)
    if numbers.start_with?("//") 
      change_delimiter(numbers)
    else
      numbers_array = numbers.split(/,|\n/)
      main_function(numbers_array)
    end
  end

  def self.change_delimiter(numbers)
    delimiter, numbers = numbers.split("\n", 2)
    delimiter = delimiter[2..-1]

    if delimiter.start_with?("*")
      star(delimiter, numbers)
    else
      delimiter_diff(delimiter, numbers)
    end
  end

  def self.star(delimiter, numbers)
    arr = numbers.split(delimiter)
    result = 1
    arr.each do |element|
      result *= element.to_i
    end

    result
  end

  def self.delimiter_diff(delimiter, numbers)
    delimiter.gsub!(/\[|\]/, '') if delimiter.start_with?('[')
    numbers = numbers.split(delimiter)
    main_function(numbers)
  end

  def self.main_function(numbers)
    numbers_array = numbers.map(&:to_i)
    reject_negative_number(numbers_array)
    reject_grether_than_thous(numbers_array)
    sum(numbers_array)
  end

  def self.reject_negative_number(numbers)
    negatives = numbers.select { |num| num < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end

  def self.reject_grether_than_thous(numbers)
    numbers.reject! { |num| num > 1000 }
  end

  def self.sum(numbers)
    numbers.sum
  end

  def self.GetCalledCount
    @add_count
  end
end
