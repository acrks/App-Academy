class ComputerPlayer
attr_reader :mark

def initialize(mark)
    @mark = mark
end

def get_position(legal_positions)
    puts "Computer " + self.mark + " selects " + legal_positions.sample.to_s
    legal_positions.sample 
end

end