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
  end
end
