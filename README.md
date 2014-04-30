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

## Build Status

[![Build Status](https://travis-ci.org/haruska/binary_decision_tree.svg?branch=master)](https://travis-ci.org/haruska/binary_decision_tree)
[![Coverage Status](https://coveralls.io/repos/haruska/binary_decision_tree/badge.png)](https://coveralls.io/r/haruska/binary_decision_tree)
[![Gem Version](https://badge.fury.io/rb/binary_decision_tree.svg)](http://badge.fury.io/rb/binary_decision_tree)
[![Dependency Status](https://gemnasium.com/haruska/binary_decision_tree.svg)](https://gemnasium.com/haruska/binary_decision_tree)
[![Code Climate](https://codeclimate.com/github/haruska/binary_decision_tree.png)](https://codeclimate.com/github/haruska/binary_decision_tree)

## Contributing

1. Fork it ( http://github.com/haruska/binary_decision_tree/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
