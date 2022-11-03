# frozen_string_literal: true

class LogStatistic
  def initialize(records)
    @records = records
  end

  def most_viewed_pages
    @most_viewed_pages ||= calculation_by(false)
  end

  def uniq_viewed_pages
    @uniq_viewed_pages ||= calculation_by(true)
  end

  private

  def calculation_by(uniq_key)
    calculate_size(uniq_key).sort_by { |_k, v| v.size }.to_h
  end

  def calculate_size(uniq)
    @records.transform_values { |value| uniq ? value.uniq.size : value.size }
  end
end
