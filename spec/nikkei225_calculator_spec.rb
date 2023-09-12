# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Nikkei225Calculator do
  describe 'basic gem features' do
    it 'has a version number' do
      expect(Nikkei225Calculator::VERSION).not_to be nil
    end
  end

  describe '#initialize' do
    let(:adj_factor_csv_filename) { 'nikkei_225_price_adjustment_factor_jp.csv' }
    let(:adj_factor) { RSpec.root.join(adj_factor_csv_filename) }
    let(:avg_weight_csv_filename) { 'nikkei_225_average_weight_jp.csv' }
    let(:avg_weight) { RSpec.root.join(avg_weight_csv_filename) }

    subject { Nikkei225Calculator.new(adj_factor:, avg_weight:) }

    it 'loads nikkei_225_price_adjustment_factor_jp.csv successfully' do
      expect(subject.avg_weight.headers).to eq(%w[対象日付 コード 銘柄名 株価換算係数 業種 セクター])
    end
    it 'loads nikkei_225_average_weight_jp.csv successfully' do
      expect(subject.avg_weight.headers).to eq(%w[日付 コード 社名 業種 セクター ウエート])
    end
  end
end
