# frozen_string_literal: true

require_relative 'log_parser'
require_relative 'log_statistic'
require_relative 'log_formatter'
require_relative 'log_presenter'

class LogStatsBuilder
  attr_reader :records

  def initialize(data:, format:)
    @data = data
    @format = format
    @records = log_parse
  end

  def build
    most_viewed_stats
    uniq_viewed_stats
  end

  def most_viewed_stats
    puts "\n"
    puts 'most viewed'
    most_viewed = LogStatistic.new(records).most_viewed_pages
    most_viewed_formatted_data = LogFormatter
                                 .new(sorted_param: most_viewed, string: 'most viewed')
                                 .array_string_format
    LogPresenter.new(most_viewed_formatted_data).console_output
  end

  def uniq_viewed_stats
    puts "\n"
    puts 'unique views'
    uniq_views = LogStatistic.new(records).uniq_viewed_pages
    uniq_views_formatted_data = LogFormatter
                                .new(sorted_param: uniq_views, string: 'uniq views')
                                .array_string_format
    LogPresenter.new(uniq_views_formatted_data).console_output
  end

  private

  def log_parse
    LogParser.new(@data).parse_log if @format == :csv
  end
end
