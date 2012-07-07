# encoding: utf-8
require 'nonograms'

describe Nonograms::Checker do

  it "should return true" do
    vertical = [[2, 1], [1]]
    horizontal = [[1], [2], [], [1]]
    Nonograms::Checker.new(vertical, horizontal).properly_data_entered?.should be_true
  end

  it "should return false" do
    vertical = [[2, 1], [1]]
    horizontal = [[1], [3], [], [1]]
    Nonograms::Checker.new(vertical, horizontal).properly_data_entered?.should be_false
  end

end
