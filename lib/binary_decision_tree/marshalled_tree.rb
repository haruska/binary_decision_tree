class BinaryDecisionTree::MarshalledTree
  attr_reader :depth
  attr_reader :decisions
  attr_reader :mask

  def initialize(depth, decisions, mask)
    @depth = depth
    @decisions = decisions
    @mask = mask
  end

  def self.from_tree(tree)
    depth = tree.depth
    decisions = 0
    mask = 0

    (2**tree.depth).times do |i|
      next if i == 0
      node = tree.at(i)
      if !node.decision.nil?
        mask |= 1 << i
        decisions |= node.decision << i
      end
    end

    new(depth, decisions, mask)
  end

  def to_tree
    tree = Tree.new(depth)

    (2**tree.depth).times do |i|
      next if i == 0

      current_position = 1 << i

      if (mask & current_position) != 0
        node = tree.at(i)
        node.decision = (decisions & current_position) == 0 ? 0 : 1
      end
    end

    tree
  end
end