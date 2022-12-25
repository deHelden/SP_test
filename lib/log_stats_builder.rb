# frozen_string_literal: true

require_relative 'log_route'
require_relative 'log_formatter'
require_relative 'log_presenter'
require 'csv'

class LogStatsBuilder
  attr_reader :routes

  def initialize(file_path:, format:)
    @file_path = file_path
    @format = format
    @routes = Hash.new { |h, k| h[k] = [] }
  end

  def build
    parse_file
    count_metrics
    output_most_viewed_stats
    output_uniq_viewed_stats
  end

  def parse_file
    #  File#each receives a block, passing each line as the argument of the block.
    #  This so far is the best method to process a file sequentially,
    #  because the lines are not all loaded into memory at the same time.
    CSV.open(@file_path, 'r', col_sep: "\s").each do |page, ip|
      route = LogRoute.new(path: page)
      @routes[route] << ip
    end
  end

  def count_metrics
    @routes.each do |route, visits|
      route.total_views_count = visits.count
      route.uniq_views_count = Set.new(visits).count
    end
  end

  def output_statistic(section)
    views = if section == :total_views
              @routes.map { |route, _visits| { route.path => route.total_views_count } }.reduce({}, :merge)
            elsif section == :unique_views
              @routes.map { |route, _visits| { route.path => route.uniq_views_count } }.reduce({}, :merge)
            else
              raise 'new section is not defined'
            end

    views_formatted = LogFormatter.new(sorted_param: views, title: section.to_s)
                                  .array_string_format

    LogPresenter.new(views_formatted).console_output
  end

  def output_most_viewed_stats
    section = :total_views
    puts "\n"
    puts 'most viewed'

    output_statistic(section)
  end

  def output_uniq_viewed_stats
    section = :unique_views
    puts "\n"
    puts 'unique views'

    output_statistic(section)
  end
end
