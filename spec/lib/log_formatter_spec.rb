# frozen_string_literal: true

require 'spec_helper'
require 'log_formatter'

RSpec.describe LogFormatter do
  subject { described_class.new(sorted_param: hash, title: str).array_string_format }

  describe '#output_data' do
    let(:hash) do
      {
        '/help_page/1' => 3,
        '/contact' => 2,
        '/index' => 1
      }
    end
    let(:str) { 'some string' }
    let(:expected_response) do
      [
        '/help_page/1    | 3 some string ',
        '/contact        | 2 some string ',
        '/index          | 1 some string '
      ]
    end

    it 'prints data to console' do
      expect(subject).to eq(expected_response)
    end
  end
end
