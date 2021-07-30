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

describe "#my_transpose" do
    it "will convert between the row-oriented and column-oriented representations" do
        expect([
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
        ].my_transpose).to eq([
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]
          ])
    end
end

describe "#stock_picker" do
    it "will output the most profitable pair of days on which to first buy stock, then sell the stock" do
        expect([2,3,1,4,1,5].stock_picker).to eq([2,5])
    end
    it "will output the most profitable pair of days because you minimize losses" do
        expect([6,5,3,1].stock_picker).to eq([6,5])
    end
end