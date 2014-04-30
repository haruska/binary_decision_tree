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

    describe "a leaf node" do
      before do
        @node = Tree.new(2).at(2)
      end

      it "should know it is a leaf node" do
        assert @node.leaf?
      end

      it "should not have a left or right child in the tree" do
        assert_nil @node.left
        assert_nil @node.right
      end

      it "should still have left and right positions" do
        assert !@node.left_position.nil?
        assert !@node.right_position.nil?
      end

      it "should have a parent" do
        assert !@node.parent.nil?
      end
    end

    describe "current depth calculation" do
      before do
        @depth_hash = {}

        #bfs
        tree = Tree.new(6) #63 nodes
        tree.depth.times do |i|
          current_depth = i + 1
          @depth_hash[current_depth] = []
          if current_depth == 1
            @depth_hash[current_depth] << tree.root
          else
            @depth_hash[current_depth - 1].each do |parent_node|
              @depth_hash[current_depth] << parent_node.left
              @depth_hash[current_depth] << parent_node.right
            end
          end
        end
      end

      it "should return the correct depth" do
        @depth_hash.each do |depth, nodes|
          nodes.each do |node|
            assert_equal depth, node.current_depth
          end
        end
      end
    end

    describe "parent position calculation" do
      before do
        @tree = Tree.new(6)
      end

      it "should be half of the current slot value" do
        i = 1
        while !@tree.at(i).nil? && !@tree.at(i).left.nil?
          node = @tree.at(i)
          assert_same node, node.left.parent
          assert_same node, node.right.parent
          i += 1
        end
      end

      it "should have a get node helper" do
        node = @tree.at(3)
        assert_equal 1, node.parent_position
        assert_same @tree.at(1), node.parent
      end
    end

    describe "child position calculations" do
      before do
        @tree = Tree.new(3)
        @node = @tree.at(2)
      end

      describe "left position calculation" do
        it "should be twice the current slot value" do
          assert_equal 4, @node.left_position
        end

        it "should have a get node helper" do
          assert_same @tree.at(4), @node.left
        end
      end

      describe "right position calculation" do
        it "should be next to the left child (one greater)" do
          assert_equal 5, @node.right_position
        end

        it "should have a get node helper" do
          assert_same @tree.at(5), @node.right
        end
      end

      end
    end
end
