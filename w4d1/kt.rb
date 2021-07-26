require_relative "00_tree_node"

class KnightPathFinder

    def initialize(pos)
        self.root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def self.valid_moves(pos)
        row, col = pos 
        if (row == 2 && col == 1) || (row == 1 && col == 2)
            return true
        else
            return false
        end
    end

    def build_move_tree

    end

    # TODO: write method build_move_tree
end

kpf = KnightPathFinder.new([0, 0])