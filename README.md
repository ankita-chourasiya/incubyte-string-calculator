StringCalculator
The StringCalculator class is a Ruby implementation designed to perform arithmetic operations on strings of numbers. It can handle custom delimiters, ignore numbers larger than 1000, and disallow negative numbers.

Features
- Basic Addition: Compute the sum of numbers separated by commas or newlines.
- Custom Delimiters: Support for single-character and multi-character custom delimiters.
- Negatives Not Allowed: Throws an exception if the input contains negative numbers.
- Ignore Large Numbers: Numbers larger than 1000 are ignored during sum calculation.
- Invocation Count: Keeps track of how many times the add method has been called.

Running Tests
This project uses RSpec for testing. To run the tests, first, make sure you have RSpec installed:

bash
Copy code
```gem install rspec```
Then, navigate to the project directory and run:

```rspec```

This will execute the tests defined in string_calculator_spec.rb, verifying the functionality of the StringCalculator.
