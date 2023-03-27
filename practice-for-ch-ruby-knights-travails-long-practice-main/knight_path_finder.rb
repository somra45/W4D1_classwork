class KnightPathFinder
    attr_reader :root
    def initialize(start_pos, end_pos)
        @start_pos = start_pos 
        @end_pos = end_pos 
        @root = PolyTreeNode.root_node(start_pos)
        @board = Array.new(8) {Array.new(8), '_'}
        @considered_positions = [start_pos]
    end

    def build_move_tree(root)
        start = root.initial_position
        possible_moves = self.new_move_positions(start)
        queue = []
        possible_moves.each do |move|
            new_node = PolyTreeNode.new(move)
            root.children << new_node
            queue << new_node
            if queue.shift.initial_position == @end_pos
                return
            else
                new_moves = new_node.new_move_positions(move)
                new_moves.each do |move1|
                    child_node = PolyTreeNode.new(move1)
                    if queue.shift.initial_position == @end_pos
                        return
                    else
                        new_node.children << child_node
                        queue += new_node.children
                    end
                end
            end
        end 


    end

    def build_move_tree_2(root)
        start = root.initial_position
        possible_moves = self.new_move_positions(start)

        possible_moves.each do |move|
            new_node = PolyTreeNode.new(move)
            root.children << new_node
            new_node.parent = root 
            return new_node if new_node.initial_position == @end_pos
        end
        root.children.each do |child|
            result = self.build_move_tree_2(child)
            return result if !result.nil?
        end 
    end
    
    def self.valid_moves(start_pos)
        x, y = start_pos 
        possible_moves = []

        possible_moves << [x+2,y+1]
        possible_moves << [x+2,y-1]
        possible_moves << [x-2,y+1]
        possible_moves << [x-2,y-1]
        possible_moves << [x+1,y+2]
        possible_moves << [x+1,y-2]
        possible_moves << [x-1,y+2]
        possible_moves << [x-1,y-2]

        valid_moves = possible_moves.select do |pos|
            (pos[0] >= 0 && pos[0] <= 7) && (pos[1] >= 0 && pos[1] <= 7)
        end
        valid_moves 
    end

    def new_move_positions(pos)
        all_pos = KnightPathFinder.valid_moves(pos)
        all_pos.select! { |pos| !@considered_positions.include?(pos) }
        all_pos 
    end
end