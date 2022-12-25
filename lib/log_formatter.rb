# frozen_string_literal: true

# This class returns formatted data as [string]
class LogFormatter
  def initialize(args = {})
    @hash = args.fetch(:sorted_param)
    @title = args.fetch(:title)
  end

  def array_string_format
    @hash.each_with_object([]) do |(route, count), obj|
      obj << "#{route.ljust(15)} | #{count} #{@title} "
    end
  end

  # hash_format, json_format, etc.
end
