# frozen_string_literal: true

require_relative 'lib/log_stats_builder'
require 'csv'

file = ARGV[0]
raise "No file detected @ #{file}" if file.nil? || !File.file?(file)

extension = File.extname(file)

if extension == '.log'
  file_content = CSV.read(file)
  LogStatsBuilder.new(data: file_content, format: :csv).build
else
  puts "Unknown mushroom @ (#{extension}). Sorry, I can't eat this right now"
end
