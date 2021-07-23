class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(init_value, parent = nil, children = [])
        @value = init_value
        @parent = parent
        @children = children
    end

    def parent=(new_parent)
        @parent = new_parent
        @children.each do |i|
            new_parent.children << i
        end
    end


end