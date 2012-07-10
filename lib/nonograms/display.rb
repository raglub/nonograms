# encoding: utf-8

class Nonograms

  #Display result on the console
  class Display

    def initialize(results, horizontal, vertical)
      @results = results
      @horizontal = horizontal
      @vertical = vertical
      @amount_row = horizontal.length
      @amount_column = vertical.length
      show_results(results)
    end

    def show_results(results)
      results.each_with_index do |result, index|
        puts "result: " + index.to_s
        show_result(result)
      end
    end

    def max_length(array)
      array.inject(0) { |result, value| result = value.length if value.length > result; result}
    end

    def show_result(result)
      print_header
      result.split("").each_with_index do |value, index|
        if index % @amount_column == 0
          print "\n"
          print_margin(index/@amount_column)
        end
        print "■ " if value == "1"
        print "  " if value == "0"
      end
      print "\n\n"
    end

    def print_header
      max_length(@vertical).times.each do |index|
        print_margin(-1)
        @vertical.each do |element|
          print element[index] || " "
          print " "
        end
        print "\n"
      end
      print_margin(-1)
      @vertical.length.times.each { |index| print "--" }
    end

    def print_margin(index)
      if index == -1
        print "  "*max_length(@horizontal) + " "
      else
        max_length(@horizontal).times do |sub_index|
          print @horizontal[index][sub_index] || " "
          print " "
        end
        print "|"
      end
    end
  end
end
