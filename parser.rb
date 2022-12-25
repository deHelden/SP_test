# frozen_string_literal: true

require_relative 'lib/log_stats_builder'

file_path = ARGV[0]
raise "No file_path detected @ #{file_path}" if file_path.nil? || !File.file?(file_path)

extension = File.extname(file_path)

if extension == '.log'
  LogStatsBuilder.new(file_path: file_path, format: :csv).build
else
  puts "Unknown mushroom @ (#{extension}). Sorry, I can't eat this right now"
end
