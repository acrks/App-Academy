require_relative 'piece'
class Board
    attr_reader :board, :null_piece

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece
        #set middle squares to null pieces  
        (2...@rows.length - 2).each do |row|
            (0...8).each do |squares|
                null_piece = NullPiece.new(nil, @rows, [row, squares])
                @rows[row][squares] = null_piece 
            end 
        end 

        #set first two rows to black pieces 
        (0...2).each do |row|
            (0...8).each do |squares|
                piece = Piece.new("black", @rows, [row, squares])
                @rows[row][squares] = piece
            end 
        end 
        
        #set last two rows to white pieces 
        (6...8).each do |row|
            (0...8).each do |squares|
                piece = Piece.new("white", @rows, [row, squares])
                @rows[row][squares] = piece
            end 
        end 

    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, value)
        @rows[pos] = value
    end

    # change board to self
    def move_piece(start_pos, end_pos, color)
        if self[start_pos] != NullPiece && self[end_pos] == NullPiece
            piece = self[start_pos]
            # Piece no longer in that position / set to Null Piece
            self[start_pos] = NullPiece.new(nil, @rows, start_pos)
            piece.pos = end_pos
            # Update end position with position of piece
            self[end_pos] = piece
            p self[start_pos], self[end_pos]
        elsif self[start_pos] == NullPiece
            raise "No piece at pos #{start_pos}" 
        elsif !self[end_pos] == NullPiece
            raise "Space occupied"
        end
    end
end

# Your Board class should hold a 2-dimensional array (an array of arrays). 
# Each position in the board either holds a moving Piece or a NullPiece (NullPiece will inherit from Piece).

# The Board class should have a #move_piece(start_pos, end_pos) method. 
# This should update the 2D grid and also the moved piece's position. You'll want to raise an exception if:
# there is no piece at start_pos or
# the piece cannot move to end_pos.