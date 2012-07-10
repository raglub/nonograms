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

    def cross_acceptable?(row, column)
      vertical_acceptable?(row, column) and horizontal_acceptable?(row, column)
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

  end
end
