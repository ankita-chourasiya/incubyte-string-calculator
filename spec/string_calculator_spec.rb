require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    context "given an empty string" do
      it "returns 0" do
        expect(StringCalculator.add("")).to eq(0)
      end
    end

    context "given '1'" do
      it "returns 1" do
        expect(StringCalculator.add("1")).to eq(1)
      end
    end

    context "given '1,2'" do
      it "returns 3" do
        expect(StringCalculator.add("1,2")).to eq(3)
      end
    end

    context "given '1\n2,3'" do
      it "returns 6" do
        expect(StringCalculator.add("1\n2,3")).to eq(6)
      end
    end

    context "given '//;\n1;2'" do
      it "returns 3 using custom delimiter" do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context "when given a string with negative numbers" do
      it "raises an exception indicating negatives are not allowed" do
        expect { StringCalculator.add("1,-2,3,-4") }.to raise_error(RuntimeError, "negatives not allowed: -2, -4")
      end
    end

    context ".GetCalledCount" do
      it "returns the number of times Add was invoked" do
        StringCalculator.instance_variable_set(:@add_count, 0)
        StringCalculator.add("1")
        StringCalculator.add("2,3")
        expect(StringCalculator.GetCalledCount).to eq(2)
      end
    end
  end
end
