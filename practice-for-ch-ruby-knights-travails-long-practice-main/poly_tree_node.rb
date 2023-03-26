class PolyTreeNode
    def self.root_node(position)
        PolyTreeNode.new(position)
    end
    
    attr_reader :initial_position
    
    def initialize(initial_position)
        @initial_position = initial_position
    end
end