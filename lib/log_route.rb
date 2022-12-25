# frozen_string_literal: true

require 'set'

# LogRoute is a class to store particular attributes and work with them in defined way.
class LogRoute
  attr_accessor :path, :total_views_count, :uniq_views_count

  def initialize(path:)
    @path = path
    @total_views_count = 0
    @uniq_views_count = 0
  end

  private

  # override hash to have ability use object as a key for Array: Array[obj]
  def hash
    path.hash
  end

  def eql?(other)
    path == other.path
  end
end
