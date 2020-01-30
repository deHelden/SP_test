# frozen_string_literal: true

class LogSorter
  def initialize(records)
    @records = records
  end

  def most_viewed_pages
    @most_viewed ||= calculate_size(false).sort_by { |_k, v| v.size }.to_h

    most_viewed
  end

  def uniq_viewed_pages
    @uniq_views ||= calculate_size(true).sort_by { |_k, v| v.size }.to_h

    uniq_views
  end

  private
  attr_reader :records, :most_viewed, :uniq_views

  def calculate_size(uniq)
    records.each_with_object({}) do |(key, value), list|
      list[key] = uniq ? value.uniq.size : value.size
    end
  end
end
