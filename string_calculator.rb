class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    numbers_array = if numbers.start_with?("//")
                      change_delimiter(numbers)
                    else
                      numbers.split(/,|\n/)
                    end

    numbers_array.map(&:to_i).sum
  end

  def self.change_delimiter(numbers)
    delimiter, numbers = numbers.split("\n", 2)
    delimiter = delimiter[2..-1]
    numbers.split(delimiter)
  end
end
