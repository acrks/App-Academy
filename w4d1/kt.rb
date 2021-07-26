require_relative "00_tree_node"

class KnightPathFinder

    attr_reader :root_node

    def initialize(pos)
        @considered_positions = [pos]
        @root_node = PolyTreeNode.new(pos)
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

    # Write an instance method #new_move_positions(pos); 
    # this should call the ::valid_moves class method, but filter out any positions that are 
    # already in @considered_positions. It should then add the remaining new positions to 
    # @considered_positions and return these new positions.

    def new_move_positions(pos)
        poss_moves = KnightPathFinder.valid_moves(pos)
        poss_moves.select! { |move| !@considered_positions.include?(move) }
        poss_moves.each do |move|
            @considered_positions << move
        end
        poss_moves
    end

    # To ensure that your tree represents only the shortest path to a given position, 
    # build your tree in a breadth-first manner. Take inspiration from your BFS algorithm: 
    # use a queue to process nodes in FIFO order. Start with a root node representing 
    # the start_pos and explore moves from one position at a time.


    # Create a node tree
    # Parent, the previous move
    # Child, all the possible moves from there
    def build_move_tree
        parent = @root_node
        queue = new_move_positions(@root_node.value)
        until queue.empty?
            # Creating new node off the first pos in the queue
            node = PolyTreeNode.new(queue.shift)
            # Adding this node as a child to the parent node
            parent.add_child(node)
            # Calculating the new move positions from node/set them as children
            children = new_move_positions(node.value)
            # Queuing up each child
            children.each do |child|
                # Adding each child to their parent node
                queue << child
                node.add_child(child)
            end
            
            parent = node
        end
        # arr = [self]
        # until arr.empty?
        #     node = arr.shift
        #     if node.value == target
        #         return node
        #     else
        #         node.children.each { |child| arr << child }
        #     end
        # end
        # return nil
    end
end

kpf = KnightPathFinder.new([0, 0])