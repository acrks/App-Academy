require_relative "00_tree_node"

class KnightPathFinder

    def initialize(pos)
        # self.root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        # With this pos passed in, where could I move from here
        row, col = pos
        valid_moves = []
        valid_moves << [row+2, col+1] if KnightPathFinder.valid_pos?([row+2, col+1])
        valid_moves << [row+1, col+2] if KnightPathFinder.valid_pos?([row+1, col+2])
        valid_moves << [row-2, col-1] if KnightPathFinder.valid_pos?([row-2, col-1])
        valid_moves << [row-1, col-2] if KnightPathFinder.valid_pos?([row-1, col-2])
        valid_moves << [row+1, col-2] if KnightPathFinder.valid_pos?([row+1, col-2])
        valid_moves << [row-1, col+2] if KnightPathFinder.valid_pos?([row-1, col+2])
        valid_moves << [row+2, col-1] if KnightPathFinder.valid_pos?([row+2, col-1])
        valid_moves << [row-2, col+1] if KnightPathFinder.valid_pos?([row-2, col+1])
        valid_moves
        # return array of pos
    end

    def self.valid_pos?(pos)
        row, col = pos
        return false if row > 7 || row < 0 || col > 7 || col < 0
        return true
    end

    # | | | | | | | | |
    # | | | | | | | | |
    # | | | | | | | | |
    # | | | | | | | | |
    # | | | | | | | | |
    # | | | | | | | | |
    # | | | | | | | | |
    # | | | | | | | | |

    def build_move_tree

    end

    # Write an instance method #new_move_positions(pos); 
    # this should call the ::valid_moves class method, but filter out any positions that are 
    # already in @considered_positions. It should then add the remaining new positions to 
    # @considered_positions and return these new positions.

    def new_move_positions(pos)
        poss_moves = KnightPathFinder.valid_moves(pos)
        poss_moves.each do |i|
            @considered_positions << i if !@considered_positions.include?(i)
        end
    end

    # TODO: write method build_move_tree
end

kpf = KnightPathFinder.new([0, 0])