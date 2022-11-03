# frozen_string_literal: true

# class presents data for different outputs
class LogPresenter
  def initialize(array)
    @array = array
  end

  def console_output
    puts @array
  end

  # db_output, json_output, etc.
end