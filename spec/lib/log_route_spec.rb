# frozen_string_literal: true

require 'spec_helper'
require 'log_route'

RSpec.describe LogRoute do
  describe '#new' do
    subject { described_class.new(path: '/help_page') }

    it 'adds visits to class' do
      expect(subject.path).to eq('/help_page')
    end

    context 'total_views_count attribute' do
      it 'is accessed' do
        expect(subject.total_views_count).to eq 0
      end

      it 'is modified' do
        subject.total_views_count += 1

        expect(subject.total_views_count).to eq(1)
      end
    end

    context 'uniq_views_count attribute' do
      it 'is accessed' do
        expect(subject.uniq_views_count).to eq 0
      end

      it 'is modified' do
        subject.uniq_views_count += 1

        expect(subject.uniq_views_count).to eq(1)
      end
    end
  end
end
