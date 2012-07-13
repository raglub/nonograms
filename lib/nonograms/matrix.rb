# encoding: utf-8

class Nonograms

  class Matrix

    def initialize(height, width)
      @height = height
      @width = width
      @matrix = create_matrix
    end

    # set cell of position row and column some value
    def set(row, column, value)
      @matrix[row][column] = value
    end

    # get the matrix
    def get
      @matrix
    end

    # count amount values '1' in vector
    # for example:
    # * vector : [0, 1, 1, 0, 0, 1, 0]
    # * return: [2, 1]
    def count_vector(vector)
      vector.join("").scan(/[1]+/).map{|element| element.length}
    end

    # get vector from index of column
    def vertical_vector(index)
      @matrix[0...@height].map{|vector| vector[index]}
    end

    # count amount values '1' in vertical vector
    def count_vertical(column)
      count_vector(vertical_vector(column))
    end

    # get vector from index of row
    def horizontal_vector(index)
      @matrix[index][0...@width]
    end

    # count amount values '1' in horizontal vector
    def count_horizontal(row)
      count_vector(horizontal_vector(row))
    end

    # get the matrix with cells values zero
    def create_matrix
      (0...@height).to_a.map {|element| [0]*@width}
    end
  end
end
