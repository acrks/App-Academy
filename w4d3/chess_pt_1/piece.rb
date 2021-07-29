class Piece
    attr_accessor :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def ==(other)
        
    end
end

# Each position in the board either holds a moving Piece or a NullPiece (NullPiece will inherit from Piece).

# There are many different kinds of pieces in chess, and each moves a specific way. 
# Based on their moves, they can be placed in four categories:

# Sliding pieces (Bishop/Rook/Queen)
# Stepping pieces (Knight/King)
# Null pieces (occupy the 'empty' spaces)
# Pawns (we'll do this class last)
# To start off, you'll want to create an empty Piece class as a placeholder for now. 
# Write code for #initialize so we can setup the board with instances of Piece in locations where a 
# Queen/Rook/Knight/ etc. will start and nil where the NullPiece will start.

class NullPiece < Piece

    def initialize(color, board, pos)
        super(color, board, pos)
    
    end 

    def symbol
        symbol = "N"
    end 


end 