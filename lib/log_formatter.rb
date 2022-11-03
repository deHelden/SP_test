# frozen_string_literal: true

require 'pry'

# This class returns formatted data as [string]
class LogFormatter
  def initialize(args = {})
    @hash = args.fetch(:sorted_param)
    @string = args.fetch(:string)
  end

  def array_string_format
    @hash.each_with_object([]) do |(route, count), obj|
      obj << "#{route.ljust(15)} | #{count} #{@string} "
    end
  end

  # hash_format, json_format, etc.
end
