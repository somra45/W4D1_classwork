class KnightPathFinder
    attr_reader :root
    def initialize(position)
        @position = position
        @root = PolyTreeNode.root_node(position)
        @board = Array.new(8) {Array.new(8), '_'}
    end

    def build_move_tree(root)

    end

    def self.valid_positions
        
    end
end