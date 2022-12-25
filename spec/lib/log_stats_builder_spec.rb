# frozen_string_literal: true

require 'spec_helper'
require 'log_stats_builder'
require 'pry'

RSpec.describe LogStatsBuilder do
  subject { described_class.new(file_path: 'spec/fixtures/webserver_template.log', format: 'log') }

  describe '#parse_file' do
    it 'creates instance of Route service' do
      allow(LogRoute).to receive(:new)

      subject.parse_file
      expect(LogRoute).to have_received(:new).exactly(6).times
    end
  end

  describe '#output_statistic' do
    context 'most_viewed' do
      let(:section) { :total_views }

      it 'creates instance of Formatter & Presenter service' do
        allow(LogPresenter).to receive_message_chain(:new, :console_output)
        allow(LogFormatter).to receive_message_chain(:new, :array_string_format)

        subject.output_statistic(section)

        expect(LogPresenter).to have_received(:new)
        expect(LogFormatter).to have_received(:new)
      end
    end
  end
end
