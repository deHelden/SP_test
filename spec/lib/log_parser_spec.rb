# frozen_string_literal: true

require 'spec_helper'
require 'log_parser'

RSpec.describe LogParser do
  context 'file not found' do
    subject { described_class.new(file) }
    let(:file) { 'no/file/here.log' }
    let(:error_message) { "No file detected @ #{file}" }

    it 'raise an error' do
      expect { subject }.to raise_error(RuntimeError, "No file detected @ #{file}")
    end
  end

  describe '#parse' do
    subject { described_class.new(file).parse }
    let(:file) { 'spec/fixtures/webserver_template.log' }
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
