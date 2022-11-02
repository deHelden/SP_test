# frozen_string_literal: true

require 'spec_helper'
require 'log_sorter'

RSpec.describe LogSorter do
  let(:records) do
    {
      '/help_page/1' => %w[126.318.035.038 929.398.951.889 722.247.931.582],
      '/contact' => %w[184.123.665.067 543.910.244.929],
      '/index' => ['444.701.448.104']
    }
  end
  let(:expected_results) do
    {
      '/help_page/1' => 3,
      '/contact' => 2,
      '/index' => 1
    }
  end

  describe '#most_viewed_pages' do
    subject { described_class.new(records).most_viewed_pages }

    it { is_expected.to eq(expected_results) }
  end

  describe '#uniq_viewed_pages' do
    subject { described_class.new(records).uniq_viewed_pages }

    it { is_expected.to eq(expected_results) }
  end
end
