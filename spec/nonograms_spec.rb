require 'nonograms'

describe Nonograms do

  context "when first cell is zero" do
    before(:each) do
      vertical = [[1], [2, 1], [1], [], [1, 1]]
      horizontal = [[1], [2, 1], [1], [1, 1]]
      @nonograms = Nonograms.new(horizontal, vertical)
    end

    it "should properly solve the nonograms" do
      @nonograms.solve.should include("01000"+"01101"+"10000"+"01001")
    end

    it "should properly entered data" do
      @nonograms.properly_data_entered?.should be_true
    end
  end

  context "when first cell is one" do

    before(:each) do
      vertical = [[3], [1], [2], [1, 1], [1, 1], [1]]
      horizontal = [[1, 3], [1], [5], [1]]
      @nonograms = Nonograms.new(horizontal, vertical)
    end

    it "should properly solve the nonograms" do
      @nonograms.solve.should include("100111" + "100000" + "111110" +  "001000")
    end
  end
end
