class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value = nil)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        if self.parent != nil 
            self.parent.children.reject! {|ele| ele == self}
        end
        @parent = parent_node
        if parent_node != nil &&  !parent_node.children.include?(self)
            parent_node.children << self 
            
        end

    end

    def add_child(node_child)
        self.children << node_child 
        node_child.parent = self 
    end

    def remove_child(self_child)
        if self.children.include?(self_child)
            self_child.parent = nil 
            self.children.reject! { |el| el == self_child }
        else
            raise "Node is not a child."
        end
    end 

    def dfs(target)
        return self if self.value == target

        self.children.each do |child|
            result = child.dfs(target)
            if result != nil
                return result
            end
        end

        nil
    end

    def bfs(target)
        return self if self.value == target
        line = self.children
        until line.empty?
            removed_child = line.shift
            if removed_child.value == target
                return removed_child
            else
                line += removed_child.children
            end
        end
        nil
    end 
end
