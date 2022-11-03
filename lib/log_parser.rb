# frozen_string_literal: true

require 'csv'

class LogParser
  def initialize(arr_of_arrs)
    @arr_of_arrs = arr_of_arrs
    @records = Hash.new { |h, k| h[k] = [] }
  end

  def parse
    @arr_of_arrs.each do |line|
      splitted_line = line[0].split(' ')

      route = splitted_line[0]
      ip    = splitted_line[1]

      @records[route] << ip
    end

    @records
  end
end
