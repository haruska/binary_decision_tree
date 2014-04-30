require 'coveralls'
Coveralls.wear!

require 'binary_decision_tree'
require 'minitest/autorun'

class MiniTest::Spec
  def assert_same_node(exp, act, msg = nil)
    assert_equal exp.decision, act.decision, msg
    assert_equal exp.slot, act.slot, msg
  end

  def assert_same_tree(exp, act, msg = nil)
    assert_equal exp.depth, act.depth, msg
    exp.size.times do |i|
      next if i == 0
      exp_node = exp.at(i)
      act_node = act.at(i)
      assert_same_node exp_node, act_node, msg
    end
  end
end


