module BinaryDecisionTree
  class Node
    LEFT = 0
    RIGHT = 1

    attr_accessor :decision #nil, 0, or 1

    attr_reader :slot #bit position
    attr_reader :tree

    def initialize(tree, slot)
      @tree = tree
      @slot = slot
      @decision = nil
    end

    def value
      case decision
        when LEFT
          left.nil? ? left_position : left.value
        when RIGHT
          right.nil? ? right_position : right.value
        else
          nil
      end
    end

    def leaf?
      left.nil? && right.nil?
    end

    def current_depth
      Math.log2(slot).floor + 1
    end

    def parent_position
      (slot % 2 == 0 ? slot + 1 : slot) / 2
    end

    def left_position
      slot * 2
    end

    def right_position
      left_position + 1
    end

    def parent
      tree.at(parent_position)
    end

    def left
      tree.at(left_position)
    end

    def right
      tree.at(right_position)
    end
  end
end
