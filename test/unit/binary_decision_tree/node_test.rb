require_relative '../../../test/test_helper'

module BinaryDecisionTree
  class NodeTest < MiniTest::Spec
    describe "creating a new node" do
      before do
        @tree = Tree.new(1)
      end

      it "should take both a tree and slot number and expose them" do
        node = Node.new(@tree, 1)

        assert_equal @tree, node.tree
        assert_equal 1, node.slot
        assert_nil node.decision
      end
    end

    describe "calculating a value" do
      before do
        @tree = Tree.new(2)
        @nodes = @tree.size.times.collect {|i| @tree.at(i)}
        @nodes.each {|n| n.decision = rand(2) unless n.nil?}
      end

      describe "when decision is left" do
        before do
          @nodes.each {|n| n.decision = Node::LEFT unless n.nil?}
        end

        it "should return the slot id of next left position on a leaf" do
          node = @nodes.last
          assert node.leaf?

          assert_equal node.left_position, node.value
        end
      end

      describe "when decision is right" do
        before do
          @nodes.each {|n| n.decision = Node::RIGHT unless n.nil?}
        end

        it "should return the slot id of next right position on a leaf" do
          node = @nodes.last
          assert node.leaf?

          assert_equal node.right_position, node.value
        end
      end

      it "should traverse the tree until at a leaf and return that value" do
        node = @tree.root
        node.decision = Node::LEFT

        assert_equal node.left.value, node.value
      end

      it "should be nil if a decision is not set" do
        node = Tree.new(1).root
        assert_nil node.decision
        assert_nil node.value
      end
    end

  end
end
