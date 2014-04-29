# BinaryDecisionTree

A binary tree designed to record decisions based on child nodes. This data structure is useful
in things like single elimination tournaments. They can be marshalled and unmarshalled to two
numbers.

## Installation

Add this line to your application's Gemfile:

    gem 'binary_decision_tree'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install binary_decision_tree

## Usage

This tree assumes a fix depth and fully populated (dense, not sparse.) It provides some nice
properties around calulating parent and child node IDs based on the current node ID.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/binary_decision_tree/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
