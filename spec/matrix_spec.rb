require 'nonograms'

describe Nonograms::Matrix do

  before(:each) do
    @matrix = Nonograms::Matrix.new(5, 6)
  end

  it "should properly count amount of numbers 1 in vector" do
    vector = [0, 0, 1, 1, 1, 0, 1]
    @matrix.count_vector(vector).should eql([3, 1])
  end

  it "should properly count amount of numbers 1 in vertical vector" do
    @matrix.set(0, 2, 1)
    @matrix.set(4, 2, 1)
    @matrix.count_vertical(2).should eql([1, 1])
  end

  it "should properly count amount of numbers 1 in horizontal vector" do
    @matrix.set(2, 1, 1)
    @matrix.set(2, 5, 1)
    @matrix.count_horizontal(2).should eql([1, 1])
  end
end
