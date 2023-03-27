class PolyTreeNode
    def self.root_node(position)
        PolyTreeNode.new(position)
    end
    
    attr_reader :initial_position, :children, :parent 
    
    def initialize(initial_position)
        @initial_position = initial_position
        @children = []
        @parent = []
    end
end