# frozen_string_literal: true

class LogParser
  def initialize(arr_of_arrs)
    @arr_of_arrs = arr_of_arrs
    @records = Hash.new { |h, k| h[k] = [] }
  end

  def parse_log
    @arr_of_arrs.each do |line|
      splitted_line = line[0].split(' ')

      route = splitted_line[0]
      ip    = splitted_line[1]

      @records[route] << ip
    end

    @records
  end
end
