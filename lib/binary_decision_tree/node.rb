class BinaryDecisionTree::Node
  attr_accessor :decision #nil, 0, or 1

  attr_reader :slot #bit position
  attr_reader :tree

  def initialize(tree, slot, decision: nil)
    @tree = tree
    @slot = slot
    @decision = decision
  end

  def value
    case decision
      when 0
        left.nil? ? left_position : left.value
      when 1
        right.nil? ? right_position : right.value
      else
        nil
    end
  end

  def leaf?
    left.nil? && right.nil?
  end

  def left_position
    slot * 2
  end

  def right_position
    left_position + 1
  end

  def left
    tree.at(left_position)
  end

  def right
    tree.at(right_position)
  end
end