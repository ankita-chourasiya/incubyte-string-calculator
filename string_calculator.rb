class StringCalculator
  @add_count = 0

  class << self
    def add(numbers)
      @add_count += 1

      return 0 if numbers.empty?

      numbers_array = get_numbers(numbers)

      numbers = numbers_array[0]
      delimiter = numbers_array[1]

      if delimiter.is_a?(String)
        if delimiter.start_with?("*")
          return numbers.reduce(:*)
        end
      end

      return sum(numbers)
    end

    def get_called_count
      @add_count
    end

    private

    def get_numbers(numbers)
      delimiter, numbers = numbers.start_with?("//") ? custom_delimiter(numbers) : [/[,\n]/, numbers]
      numbers_array = numbers.split(delimiter).map(&:to_i)
      [filter_numbers(numbers_array), delimiter]
    end

    def custom_delimiter(numbers)
      delimiter, numbers = numbers.split("\n", 2)
      delimiter = delimiter[2..-1]
      delimiter = delimiter.gsub!(/\[|\]/, '') if delimiter.start_with?('[')
      [delimiter, numbers]
    end

    def filter_numbers(numbers)
      reject_negative_numbers(numbers)
      reject_greater_than_1000(numbers)
    end

    def reject_negative_numbers(numbers)
      negatives = numbers.select { |num| num < 0 }
      raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?
    end

    def reject_greater_than_1000(numbers)
      numbers.reject { |num| num > 1000 }
    end

    def sum(numbers)
      numbers.sum
    end
  end
end
