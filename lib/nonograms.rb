# encoding: utf-8
require "nonograms/version"
require "nonograms/logic"
require "nonograms/display"
require "nonograms/checker"

# class can solve the matrix game Nonograms
class Nonograms

  def initialize(horizontal, vertical)
    @vertical = vertical
    @horizontal = horizontal
    @amount_row = horizontal.length
    @amount_column = vertical.length
    @logic = Nonograms::Logic.new(@horizontal, @vertical)
    @results = []
  end

  # solve the nonograms
  def solve
    return @results unless @results.empty?

    run_recursion
    @logic.matrix.set(0, 0, 1)
    run_recursion

    @results
  end

  # display the result on console
  def display
    Nonograms::Display.new(@results, @horizontal, @vertical)
  end

  def properly_data_entered?
    Nonograms::Checker.new(@vertical, @horizontal).properly_data_entered?
  end

private

  # run recursion from fixed position row and column if @matrix is acceptable
  def run_recursion(row = 0, column = 0)
    return unless @logic.cross_acceptable?(row, column)
    return if last_cell?(row, column)
    next_cell_set(0, row, column)
    next_cell_set(1, row, column)
  end

  def last_cell?(row, column)
    return false unless row == @amount_row-1 and column == @amount_column-1
    @results << Marshal.load(Marshal.dump(@logic.matrix.get)).flatten.join("")
    true
  end

  # set next cell of matrix on "value"
  def next_cell_set(value, row, column)
    new_row = (row*@amount_column + column + 1) / @amount_column
    new_column = (row*@amount_column + column + 1) % @amount_column

    @logic.matrix.set(new_row, new_column, value)
    run_recursion(new_row, new_column)
    @logic.matrix.set(new_row, new_column, 0)
  end

end
