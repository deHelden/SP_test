# frozen_string_literal: true

require_relative 'lib/log_parser'
require_relative 'lib/log_sorter'
require_relative 'lib/log_presenter'

parser = LogParser.new(ARGV[0])
records = parser.parse

puts "\n"
puts 'most viewed'
most_viewed = LogSorter.new(records).most_viewed_pages
LogPresenter.new(sorted_param: most_viewed, string: 'most viewed').output_data

puts "\n"
puts 'unique views'
uniq_views = LogSorter.new(records).uniq_viewed_pages
LogPresenter.new(sorted_param: uniq_views, string: 'uniq views').output_data
