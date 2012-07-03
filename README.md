# Nonograms

  Solve the puzzle game nonograms.

## Installation

Add this line to your application's Gemfile:

    gem 'nonograms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nonograms

## Usage

    For example:

              2           1
          1   1   1       1
        +---+---+---+---+---+
      1 |   |   |   |   |   |
        +---+---+---+---+---+
    2 1 |   |   |   |   |   |
        +---+---+---+---+---+
    2 1 |   |   |   |   |   |
        +---+---+---+---+---+
    2 1 |   |   |   |   |   |
        +---+---+---+---+---+

We should get result

              2           1
          1   1   1       1
        +---+---+---+---+---+
      1 |   | # |   |   |   |
        +---+---+---+---+---+
    2 1 |   | # | # |   | # |
        +---+---+---+---+---+
    2 1 | # |   |   |   |   |
        +---+---+---+---+---+
    2 1 |   | # |   |   | # |
        +---+---+---+---+---+

in line result should be "01000"+"01101"+"10000"+"01001"

You can solve this example when you write the code below

    > require "nonograms"

    > vertical = [[1], [2, 1], [1], [], [1, 1]]
    > horizontal = [[1], [2, 1], [1], [1, 1]]
    > @nonograms = Nonograms.new(vertical, horizontal)
    > @nonograms.solve
    > @nonograms.results #=> ["01000"+"01101"+"10000"+"01001", ...]

