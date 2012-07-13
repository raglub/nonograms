# encoding: utf-8
require 'nonograms/matrix'

class Nonograms

  class Logic

    def initialize(horizontal, vertical)
      @vertical = vertical
      @horizontal = horizontal
      @amount_row = horizontal.length
      @amount_column = vertical.length
      @matrix = Nonograms::Matrix.new(@amount_row, @amount_column)
    end

    def matrix
      @matrix
    end

    # the vertical and the horizontal vectors have acceptable values
    def cross_acceptable?(row, column)
      vertical_acceptable?(row, column) and horizontal_acceptable?(row, column)
    end

    # the vertical vector have acceptable values
    def vertical_acceptable?(row, column)
      unless row == @amount_row-1
        vector_acceptable?( @vertical[column], @matrix.count_vertical(column) )
      else
        return  ( @vertical[column] == @matrix.count_vertical(column) )
      end
    end

    # the horizontal vector have acceptable values
    def horizontal_acceptable?(row, column)
      unless column == @amount_column-1
        vector_acceptable?( @horizontal[row], @matrix.count_horizontal(row) )
      else
        return ( @horizontal[row] == @matrix.count_horizontal(row))
      end
    end

    # the vector have acceptable values
    # * origin - vector base
    # * piece - vector to verifi
    # * return - true or false
    # example:
    # origin = [3, 2, 2]; piece = [3, 1]; return true
    # origin = [3, 2, 2]; piece = [3, 3]; return false
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
