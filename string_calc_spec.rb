require 'rspec'
require_relative 'string_calc'

RSpec.describe StringCalc do
  
  describe ".add" do
    context "when empty string is passed" do
      it "returns 0" do
        expect(StringCalc.add("")).to eq(0)
        expect(StringCalc.add(" ")).to eq(0)
      end
    end

    context "when string with more than 2 numbers is passed" do
      it "returns the sum of those 2 numbers" do
        expect(StringCalc.add("1, 2")).to eq(3)
        expect(StringCalc.add("3, 4, 6, 10")).to eq(23)
      end
    end

    context "when string with more than 2 numbers with multiple delimiters is passed" do
      it "returns the sum of all numbers" do
        expect(StringCalc.add("1, 2; 3\n 5")).to eq(11)
        expect(StringCalc.add("3\n4, 6; 10")).to eq(23)
      end
    end
  end
end
