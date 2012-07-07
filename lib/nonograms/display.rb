# encoding: utf-8

class Nonograms
  class Display

    def initialize(results, amount_row, amount_column)
      @results = results
      @amount_row = amount_row
      @amount_column = amount_column
      show_results(results)
    end

    def show_results(results)
      results.each_with_index do |result, index|
        puts "result: " + index.to_s
        show_result(result)
      end
    end

    def show_result(result)
      result.split("").each_with_index do |value, index|
        print "\n" if index % @amount_column == 0
        print "■ " if value == "1"
        print "  " if value == "0"
      end
      print "\n\n"
    end
  end
end
