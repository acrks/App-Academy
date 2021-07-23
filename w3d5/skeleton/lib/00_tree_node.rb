class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(init_value, parent = nil, children = [])
        @value = init_value
        @parent = parent
        @children = children
    end

    def parent=(new_parent)
        # old_parent = @parent
        # old_parent.children.delete(self)
        # if new_parent != nil
            @parent = new_parent
            new_parent.children << self 
        # end
    end

    # def add_child(child)
    #     if !children.include?(child) && !child.nil?
    #         children << child
    #     end
    # end

    # def remove_child
        
    # end

    #A
    #B 
    #C
    # NodeB
    #Node C: Parent: B, Children: []
    #Node B: Parent: A, Children [C]


end