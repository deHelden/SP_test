# frozen_string_literal: true

class LogPresenter
  def initialize(args = {})
    @hash = args.fetch(:sorted_param)
    @string = args.fetch(:string)
  end

  def output_data
    @hash.each do |route, count|
      puts " #{route.ljust(15)} | #{count} #{@string} "
    end
  end
end
