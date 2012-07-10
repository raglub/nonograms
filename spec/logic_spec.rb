# encoding: utf-8
require 'nonograms'

describe Nonograms::Logic do

  before(:each) do
    vertical = [[1], [2, 1], [1], [], [1, 1]]
    horizontal = [[1], [2, 1], [1], [1, 1]]
    @logic = Nonograms::Logic.new(horizontal, vertical)
  end

  it "for vectors acceptable" do
    origin = [3, 1, 2]
    @logic.vector_acceptable?(origin, [3, 1]).should be_true
    @logic.vector_acceptable?(origin, [3, 1, 2]).should be_true
    @logic.vector_acceptable?(origin, [3, 1, 1]).should be_true
    @logic.vector_acceptable?(origin, []).should be_true
  end

  it "for vectors don't acceptable" do
    origin = [3, 1, 2]
    @logic.vector_acceptable?(origin, [4, 1]).should be_false
    @logic.vector_acceptable?(origin, [3, 1, 2, 4]).should be_false
    @logic.vector_acceptable?(origin, [3, 1, 3]).should be_false
  end

end
