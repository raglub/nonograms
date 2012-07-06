# encoding: utf-8
module Nonograms

  # class can solve the puzzle game Nonograms
  class Solver

    attr_reader :results

    def initialize(vertical, horizontal)
      @vertical = vertical
      @horizontal = horizontal
      @amount_row = horizontal.length
      @amount_column = vertical.length
      @puzzle = empty_puzzle
      @results = []
    end

    # solve the nonograms
    def solve
      return @results unless @results.empty?
      run_recursion
      @results
    end

  private

    # get the matrix with cells values zero
    def empty_puzzle
      result = []
      @amount_row.times do |index|
        result << [0]*@amount_column
      end
      result
    end

    # run recursion from fixed position row and column if @puzzle is acceptable
    def run_recursion(row = 0, column = 0)
      return unless vertical_acceptable?(row, column) and horizontal_acceptable?(row, column)
      if row == @amount_row-1 and column == @amount_column-1
        @results << Marshal.load(Marshal.dump(@puzzle)).flatten.join("")
        return nil
      end
      next_cell_set(0, row, column)
      next_cell_set(1, row, column)
    end

    def next_cell_set(value, row, column)
      new_row = (row*@amount_column + column + 1) / @amount_column
      new_column = (row*@amount_column + column + 1) % @amount_column
      @puzzle[new_row][new_column] = value
      run_recursion(new_row, new_column)
      @puzzle[new_row][new_column] = 0
    end

    # count amount values '1' in vector
    # for example:
    # * vector : [0, 1, 1, 0, 0, 1, 0]
    # * return: [2, 1]
    def count_vector(vector)
      vector.join("").scan(/[1]+/).map{|element| element.length}
    end

    # count amount values '1' in vertical vector
    def count_vertical(column)
      vertical_vector = @puzzle[0...@amount_row].map{|vector| vector[column]}
      count_vector(vertical_vector)
    end

    # count amount values '1' in vertical vector
    def count_horizontal(row)
      horizontal_vector = @puzzle[row][0...@amount_column]
      count_vector(horizontal_vector)
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
end
