require "./poly_tree_node.rb"

class KnightPathFinder
    attr_reader :root
    def initialize(start_pos, end_pos)
        @start_pos = start_pos 
        @end_pos = end_pos 
        @root = PolyTreeNode.new(start_pos)
        @board = Array.new(8) {Array.new(8, '_')}
        @considered_positions = [start_pos]
        build_move_tree(@root)
    end

    def build_move_tree(root)
        queue = [root]
        until queue.empty?
            current_node = queue.shift
            possible_moves = new_move_positions(current_node.value)
            possible_moves.each do |move|
                new_node = PolyTreeNode.new(move)
                current_node.add_child(new_node)
                queue << new_node
                @considered_positions << new_node.value
            end
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

