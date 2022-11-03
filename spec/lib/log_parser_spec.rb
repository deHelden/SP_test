# frozen_string_literal: true

require 'spec_helper'
require 'log_parser'

RSpec.describe LogParser do
  describe '#parse' do
    subject { described_class.new(array).parse }

    let(:array) do
      [
        ['/help_page/1 126.318.035.038'],
        ['/contact 184.123.665.067'],
        ['/help_page/1 929.398.951.889'],
        ['/index 444.701.448.104'],
        ['/help_page/1 722.247.931.582'],
        ['/contact 543.910.244.929']
      ]
    end
    let(:expected_results) do
      {
        '/help_page/1' => %w[126.318.035.038 929.398.951.889 722.247.931.582],
        '/contact' => %w[184.123.665.067 543.910.244.929],
        '/index' => ['444.701.448.104']
      }
    end

    it { is_expected.to eq(expected_results) }
  end
end
