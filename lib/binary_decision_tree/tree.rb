class BinaryDecisionTree::Tree
  attr_reader :depth

  def initialize(depth)
    @depth = depth
    @nodes = Array.new(2**depth) {|i| i == 0 ? nil : Node.new(self, i)}
  end

  def root
    @nodes[1]
  end

  def at(position)
    @nodes[position]
  end
end