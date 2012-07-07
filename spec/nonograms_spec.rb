require 'nonograms'

describe "Nonograms" do

  before(:each) do
    vertical = [[1], [2, 1], [1], [], [1, 1]]
    horizontal = [[1], [2, 1], [1], [1, 1]]
    @nonograms = Nonograms.new(horizontal, vertical)
  end

  it "should properly solve the nonograms" do
    @nonograms.solve.should include("01000"+"01101"+"10000"+"01001")
  end

  it "should properly count amount of numbers 1 in vector" do
    vector = [0, 0, 1, 1, 1, 0, 1]
    @nonograms.count_vector(vector).should eql([3, 1])
  end

  it "for vectors acceptable" do
    origin = [3, 1, 2]
    @nonograms.vector_acceptable?(origin, [3, 1]).should be_true
    @nonograms.vector_acceptable?(origin, [3, 1, 2]).should be_true
    @nonograms.vector_acceptable?(origin, [3, 1, 1]).should be_true
    @nonograms.vector_acceptable?(origin, []).should be_true
  end

  it "for vectors don't acceptable" do
    origin = [3, 1, 2]
    @nonograms.vector_acceptable?(origin, [4, 1]).should be_false
    @nonograms.vector_acceptable?(origin, [3, 1, 2, 4]).should be_false
    @nonograms.vector_acceptable?(origin, [3, 1, 3]).should be_false
  end
end
