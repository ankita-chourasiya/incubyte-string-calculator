class StringCalculator
  @add_count = 0

  class << self
    def add(numbers)
      @add_count += 1

      return 0 if numbers.empty?

      numbers_array = get_numbers(numbers)
    end

    def get_numbers(numbers)
      if numbers.start_with?("//")
        change_delimiter(numbers)
      else
        numbers_array = numbers.split(/,|\n/)
        numbers_array = reject_unwanted_numbers(numbers_array)
        sum(numbers_array)
      end
    end

    def change_delimiter(numbers)
      delimiter, numbers = numbers.split("\n", 2)
      delimiter = delimiter[2..-1]
      
      if delimiter.start_with?("*")
        star(delimiter, numbers)
      else
        delimiter_diff(delimiter, numbers)
      end
    end

    def star(delimiter, numbers)
      split_numbers = numbers.split(delimiter)
      numbers_array = reject_unwanted_numbers(split_numbers)
      numbers_array.reduce(:*)
    end

    def delimiter_diff(delimiter, numbers)
      delimiter.gsub!(/\[|\]/, '') if delimiter.start_with?('[')
      split_numbers = numbers.split(delimiter)
      numbers_array = reject_unwanted_numbers(split_numbers)
      sum(numbers_array)
    end

    def reject_unwanted_numbers(numbers)
      numbers_array = numbers.map(&:to_i)
      reject_negative_number(numbers_array)
      reject_grether_than_thous(numbers_array)
      numbers_array
    end

    def reject_negative_number(numbers)
      negatives = numbers.select { |num| num < 0 }
      raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
    end

    def reject_grether_than_thous(numbers)
      numbers.reject! { |num| num > 1000 }
    end

    def sum(numbers)
      numbers.sum
    end

    def GetCalledCount
      @add_count
    end
  end
end
