# encoding: utf-8
require "nonograms/version"
require "nonograms/display"
require "nonograms/checker"
require "nonograms/matrix"

# class can solve the matrix game Nonograms
class Nonograms

  def initialize(horizontal, vertical)
    @vertical = vertical
    @horizontal = horizontal
    @amount_row = horizontal.length
    @amount_column = vertical.length
    @matrix = Nonograms::Matrix.new(@amount_row, @amount_column)
    @results = []
  end

  # solve the nonograms
  def solve
    return @results unless @results.empty?
    run_recursion
    @results
  end

  # display the result on console
  def display
    Nonograms::Display.new(@results, @amount_row, @amount_column)
  end

  def properly_data_entered?
    Nonograms::Checker.new(@vertical, @horizontal).properly_data_entered?
  end

  def vertical_acceptable?(row, column)
    unless row == @amount_row-1
      vector_acceptable?( @vertical[column], @matrix.count_vertical(column) )
    else
      return  ( @vertical[column] == @matrix.count_vertical(column) )
    end
  end

  def horizontal_acceptable?(row, column)
    unless column == @amount_column-1
      vector_acceptable?( @horizontal[row], @matrix.count_horizontal(row) )
    else
      return ( @horizontal[row] == @matrix.count_horizontal(row))
    end
  end

  def vector_acceptable?(origin, piece)
    return false if piece.length > origin.length
    piece.each_with_index do |value, index|
      if index == piece.length-1
        return false unless origin[index] >= piece[index]
      else
        return false unless origin[index] == piece[index]
      end
    end
    return true
  end

private

  # run recursion from fixed position row and column if @matrix is acceptable
  def run_recursion(row = 0, column = 0)
    return unless vertical_acceptable?(row, column) and horizontal_acceptable?(row, column)
    if row == @amount_row-1 and column == @amount_column-1
      @results << Marshal.load(Marshal.dump(@matrix.get)).flatten.join("")
      return nil
    end
    next_cell_set(0, row, column)
    next_cell_set(1, row, column)
  end

  def next_cell_set(value, row, column)
    new_row = (row*@amount_column + column + 1) / @amount_column
    new_column = (row*@amount_column + column + 1) % @amount_column
    @matrix.set(new_row, new_column, value)
    run_recursion(new_row, new_column)
    @matrix.set(new_row, new_column, 0)
  end

end
