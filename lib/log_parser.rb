# frozen_string_literal: true

require 'csv'

class LogParser
  attr_reader :records

  def initialize(file)
    check_file_presence(file)
    @file = file
    @records = Hash.new { |h, k| h[k] = [] }
  end

  def parse
    CSV.foreach(@file) do |line|
      splitted_line = line[0].split(' ')
      route = splitted_line[0]
      ip    = splitted_line[1]
      @records[route] << ip
    end

    records
  end

  private

  def check_file_presence(file)
    raise "No file detected @ #{file}" unless File.file?(file)
  end
end
