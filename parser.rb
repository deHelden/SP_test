# frozen_string_literal: true

require_relative 'lib/log_parser'
require_relative 'lib/log_statistic'
require_relative 'lib/log_formatter'
require_relative 'lib/log_presenter'

require 'csv'

file = ARGV[0]
raise "No file detected @ #{file}" unless File.file?(file)

arr_of_arrs = CSV.read(file)
records = LogParser.new(arr_of_arrs).parse

puts "\n"
puts 'most viewed'
most_viewed = LogStatistic.new(records).most_viewed_pages
most_viewed_formatted_data = LogFormatter
                             .new(sorted_param: most_viewed, string: 'most viewed')
                             .array_string_format
LogPresenter.new(most_viewed_formatted_data).console_output

puts "\n"
puts 'unique views'
uniq_views = LogStatistic.new(records).uniq_viewed_pages
uniq_views_formatted_data = LogFormatter
                            .new(sorted_param: uniq_views, string: 'uniq views')
                            .array_string_format
LogPresenter.new(uniq_views_formatted_data).console_output
