# encoding: utf-8
require "nonograms/version"

# class can solve the puzzle game Nonograms
class Nonograms

  attr_reader :results

  def initialize(vertical, horizontal)
    @vertical = vertical
    @horizontal = horizontal
    @amount_row = horizontal.length
    @amount_column = vertical.length
    @puzzle = []
    @amount_row.times do |index|
      @puzzle << [0]*@amount_column
    end
    @results = []
  end

  def solve(row = 0, column = 0)
    if vertical_acceptable?(row, column) and horizontal_acceptable?(row, column)
      if row == @amount_row-1 and column == @amount_column-1
        @results <<  Marshal.load(Marshal.dump(@puzzle)).flatten.join("")
        return @amount_column
      end
      next_cell_set(0, row, column)
      next_cell_set(1, row, column)
    end
  end

private

  def next_cell_set(value, row, column)
    new_row = (row*@amount_column + column + 1) / @amount_column
    new_column = (row*@amount_column + column + 1) % @amount_column
    @puzzle[new_row][new_column] = value
    solve(new_row, new_column)
    @puzzle[new_row][new_column] = 0
  end

  # count values '1' in vertical
  def count_vertical(column)
    result, counter = [], 0
    @amount_row.times do |index|
      if @puzzle[index][column] == 1
        counter += 1
      else
        result << counter unless counter == 0
        counter = 0
      end
      result << counter if index == @amount_row-1 and not counter == 0
    end
    result
  end

  # count values '1' in horizontal
  def count_horizontal(row)
    result, counter = [], 0
    @amount_column.times do |index|
      if @puzzle[row][index] == 1
        counter += 1
      else
        result << counter unless counter == 0
        counter = 0
      end
      result << counter if index == @amount_column-1 and not counter == 0
    end
    result
  end

  def vertical_acceptable?(row, column)
    unless row == @amount_row-1
      vector_acceptable?( @vertical[column], count_vertical(column) )
    else
      return  ( @vertical[column] == count_vertical(column) )
    end
  end

  def horizontal_acceptable?(row, column)
    unless column == @amount_column-1
      vector_acceptable?( @horizontal[row], count_horizontal(row) )
    else
      return ( @horizontal[row] == count_horizontal(row))
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

end
