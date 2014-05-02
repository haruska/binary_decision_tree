require_relative '../../../test/test_helper'

module BinaryDecisionTree
  class SubNode < Node; end

  class TreeTest < MiniTest::Spec
    describe "creating a new tree" do
      it "should allow an optional node class" do
        assert_equal Node, Tree.new(1).root.class
        assert_equal SubNode, Tree.new(1, node_class: SubNode).root.class
      end
    end
  end
end
