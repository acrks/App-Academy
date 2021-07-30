require 'towers_of_hanoi'
require "rspec"

describe TowerofHanoi do
    subject(:board) {TowerofHanoi.new}
    
    describe "#initialize" do
        context "with valid args" do 
            it "should instantiate a board correctly" do 
                expect(board.instance_variable_get)("@board").to be(:Array)
            end
        end
    end

    describe "#createBoard" do 
        it "should create a board as a 2D array with 3 inner arrays" do
            expect(new_arr).to eq([[],[],[]])
        end

        # it "should ask player 'How many discs would you like to play with'" do
        #     expect()
        # end
        # it "should get input from user to select starting position to take disc from" do
        #     expect(input).to eq(4)
        # end
    end

    describe "#get_num_discs" do
        it "to return 4" do
            expect(board.get_num_discs).to eq(4)
            # expect TowerofHanoi to receive get_num_discs and return Integer
        end
    end

    # describe "Scenario Win" do 
    #     it "move the original stack to another stack wiht the largest element on the bottom, and the smallest element on top" do
            
    #     end
    # end
end
