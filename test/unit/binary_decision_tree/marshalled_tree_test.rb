require_relative '../../../test/test_helper'

module BinaryDecisionTree
  class SubTree < Tree; end

  class MarshalledTreeTest < MiniTest::Spec
    before do
      @tree = Tree.new(6)
      @tree.size.times do |i|
        next if i == 0
        @tree.at(i).decision = rand(2)
      end

      @marshalled_tree = MarshalledTree.from_tree(@tree)
    end

    describe "marshalling a tree" do
      it "should marshal and unmarshal to the same tree" do
        assert_same_tree @tree, @marshalled_tree.to_tree
      end

      it "should be able to unmarshal from numeric values" do
        another_tree = MarshalledTree.new(@tree.depth, @marshalled_tree.decisions, @marshalled_tree.mask).to_tree
        assert_same_tree @tree, another_tree
      end
    end

    describe "using a different tree class" do
      it "should instantiate the correct object type" do
        assert_equal Tree, @marshalled_tree.to_tree.class
        assert_equal SubTree, @marshalled_tree.to_tree(tree_class: SubTree).class
      end
    end
  end
end
