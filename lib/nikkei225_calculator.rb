# frozen_string_literal: true

require 'csv'
require 'bigdecimal'

require_relative 'nikkei225_calculator/version'

module Nikkei225Calculator
  class Csv
    attr_reader :adj_factor, :avg_weight

    def self.converter_proc
      Proc.new do |field, field_info|
        next field unless field.include?('.')
        BigDecimal(field.delete_suffix('%'))
      end
    end

    def initialize(adj_factor:, avg_weight:)
      @adj_factor = CSV.read(adj_factor, headers: true, converters: self.class.converter_proc)
      @avg_weight = CSV.read(avg_weight, headers: true, converters: self.class.converter_proc)
    end
  end
end
