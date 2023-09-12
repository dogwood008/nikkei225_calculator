# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Nikkei225Calculator do
  describe 'basic gem features' do
    it 'has a version number' do
      expect(Nikkei225Calculator::VERSION).not_to be nil
    end
  end

  describe Nikkei225Calculator::Csv do
    describe '#initialize' do
      let(:adj_factor_csv_filename) { 'nikkei_225_price_adjustment_factor_jp.csv' }
      let(:adj_factor) { RSpec.root.join(adj_factor_csv_filename) }
      let(:avg_weight_csv_filename) { 'nikkei_stock_average_weight_jp.csv' }
      let(:avg_weight) { RSpec.root.join(avg_weight_csv_filename) }

      let(:csv_instance) { described_class.new(adj_factor:, avg_weight:) }

      describe 'loading nikkei_225_price_adjustment_factor_jp.csv successfully' do
        subject { csv_instance.adj_factor }
        it 'load successfully' do
          expect(subject.headers).to eq(%w[対象日付 コード 銘柄名 株価換算係数 業種 セクター])
        end
        it do
          expect(subject.first.to_h.values).to eq(
            ["2023/09/12", "1234", "テスト株式会社", BigDecimal('1.0'), "水産", "消費"]
          )
        end
      end
      describe 'loading nikkei_stock_average_weight_jp.csv successfully' do
        subject { csv_instance.avg_weight }
        it do
          expect(subject.headers).to eq(%w[日付 コード 社名 業種 セクター ウエート])
        end
        it do
          expect(subject.first.to_h.values).to eq(
            ["2023/09/12", "1234", "テスト株式会社", "水産", "消費", BigDecimal('0.1234')]
          )
        end
      end
    end
  end
end
