require 'nonograms'

describe "Nonograms" do

  before(:each) do
    vertical = [[1], [2, 1], [1], [], [1, 1]]
    horizontal = [[1], [2, 1], [1], [1, 1]]
    @nonograms = Nonograms.new(vertical, horizontal)
  end

  it "should properly solve the nonograms" do
    @nonograms.solve
    @nonograms.results.should include("01000"+"01101"+"10000"+"01001")
  end
end
