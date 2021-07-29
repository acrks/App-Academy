require "rspec"
require 'tdd'

describe "::my_uniq" do 
    it "returns the unqiue elements of the array in the order they appeared" do
        expect([1, 2, 1, 3, 3].my_uniq).to eq([1,2,3])
    end
end

describe "#two_sum" do 
    it "returns the indices at which the element pair sums to 0" do
        expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "returns the indices ordered by smallest to largest (smaller first elements comes first/then smaller second elements come first)" do
        expect([-1, 0, 2, -2, 1].reverse.two_sum).to eq([[0, 4], [1, 2]])
    end
end