# frozen_string_literal: true

require 'spec_helper'
require 'log_presenter'

RSpec.describe LogPresenter do
  describe '#console_output' do
    subject { described_class.new(sorted_param: hash, string: str).console_output }

    let(:hash) { ['/help_page/1  |  3', '/vk.com/1  |  2'] }
    let(:str) { 'some string' }

    it 'prints data to console' do
      expect { subject }.to output.to_stdout
    end

    # provide a check for expected_result print
  end
end
