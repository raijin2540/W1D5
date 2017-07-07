require_relative "00_tree_node"
require 'byebug'
class KnightPathFinder
  attr_reader :start_pos

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
  end

  def build_move_tree
    root = PolyTreeNode.new(@start_pos)
    queue = [root]

    until queue.empty?
      debugger
      current_node = queue.shift
      new_pos = new_move_positions(current_node.value)

      new_pos.each do |pos|
        new_node = PolyTreeNode.new(pos)
        new_node.parent = current_node
        queue << new_node
      end
    end

    root
  end

  def self.valid_moves(start_pos)
    valid_moves = []
    move_range = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]

    move_range.each do |move|
      x, y = move
      new_move = [start_pos[0] + x, start_pos[1] + y]
      valid_moves << new_move
    end

    valid_moves.reject do |move|
      move.any? { |num| num < 0 || num > 7 }
    end

  end

  def new_move_positions(pos)
    new_pos = self.class.valid_moves(pos) - @visited_positions
    @visited_positions += new_pos
    new_pos
  end

end
