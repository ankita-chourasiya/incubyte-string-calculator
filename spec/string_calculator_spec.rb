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
  end
end
