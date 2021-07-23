class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(init_value, parent = nil, children = [])
        @value = init_value
        @parent = parent
        @children = children
    end

    # def inspect
    #     p value, parent, children
    # end

    def parent=(new_parent)
        
        @parent.children.delete(self) if @parent != nil
        # new_parent.parent=(nil) if @parent == nil #root
        if new_parent != nil && !new_parent.children.include?(self)
            new_parent.children << self 
        end
        @parent = new_parent
    end

    # A
    # B

    # Changing A to be child of B

    # B
    # A

    # old parent == nil
    # new parent = B
    # remove B as child of A
    # add A as child of B



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