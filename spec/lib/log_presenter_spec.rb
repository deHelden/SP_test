# frozen_string_literal: true

require 'spec_helper'
require 'log_presenter'

RSpec.describe LogPresenter do
  subject { described_class.new(sorted_param: hash, string: str).output_data }

  describe '#output_data' do
    let(:hash) { { '/help_page/1' => 3 } }
    let(:str) { 'some string' }

    it 'prints data to console' do
      expect { subject }.to output.to_stdout
    end
  end
end
