# frozen_string_literal: true

module Dappgen
  class Script
    attr_reader :opts

    def initialize(dapper_config, opts)
      @dapper_config = dapper_config
      @opts = opts
    end

    def built_script
      result = []

      @dapper_config.script.each do |statements|
        result_statement = {}
        statements.each do |key, value|
          if value.is_a? String
            value = value.gsub(/<([^>]+)>/) do |match|
              opts[match[1..-2].to_sym]
            end
          end

          result_statement[key] = value
        end
        result << result_statement
      end

      result
    end
  end
end
