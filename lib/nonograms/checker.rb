# encoding: utf-8

class Nonograms
  class Checker

    def initialize(vertical, horizontal)
      @vertical = vertical
      @horizontal = horizontal
    end

    def properly_data_entered?
      @vertical.flatten.inject(&:+) == @horizontal.flatten.inject(&:+)
    end

    # TODO
  end
end
