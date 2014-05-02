module BinaryDecisionTree
  class Tree
    attr_reader :depth

    def initialize(depth, node_class: Node)
      @depth = depth
      @nodes = Array.new(size) {|i| i == 0 ? nil : node_class.new(self, i)}
    end

    def root
      @nodes[1]
    end

    def at(position)
      @nodes[position]
    end

    def size
      2**depth
    end
  end
end
