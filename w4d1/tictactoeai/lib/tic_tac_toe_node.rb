require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    available_moves = []
    (0...@board.rows.length).each do |i|
      (0...@board.rows[i].length).each do |j|
        new_board = board.dup
        available_moves << TicTacToeNode.new(new_board, next_mover_mark.next, [i,j]) if @board.empty?([i,j])
      end
    end
    available_moves
  end
end
