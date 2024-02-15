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
      context "with a single delimiter as a comma" do
        it "returns the sum of those 2 numbers" do
          expect(StringCalc.add("1, 2")).to eq(3)
          expect(StringCalc.add("3, 4, 6, 10")).to eq(23)
        end
      end

      context "with multiple delimiters" do
        context "with all the positive numbers inside it" do
          it "returns the sum of all numbers" do
            expect(StringCalc.add("1, 2; 3\n 5")).to eq(11)
            expect(StringCalc.add("3\n4, 6; 10")).to eq(23)
            expect(StringCalc.add("//1,2;3\n6\n\n8,asdvr  11; jhfdv5")).to eq(36)
            expect(StringCalc.add("//2,4;3\n7\n\n8,asdvr 15 10; jhfdv")).to eq(49)
          end
        end

        context "with some of the negative numbers inside it" do
          it "raises an exception with the array of negative numbers" do
            expect {StringCalc.add("//1,--2;3\n-6\n\n8,asdvr  11; jhfdv5")}.to raise_error(ArgumentError, "Negative numbers are not allowed: -2,-6")
            expect {StringCalc.add("//-2,4;3\n-7\n\n8,asdvr -15 10; jhfdv")}.to raise_error(ArgumentError, "Negative numbers are not allowed: -2,-7,-15")
          end
        end
      end
    end
  end
end
