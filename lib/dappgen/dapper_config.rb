# frozen_string_literal: true

module Dappgen
  class DapperConfig
    def self.execute(filename)
      DapperConfig.new(File.read(filename), filename)
    end

    attr_reader :arguments, :script

    def initialize(script, filename)
      @arguments = {}
      @script = []
      instance_eval script, filename
    end

    def requires(argument_name)
      @arguments[argument_name] = {
        required: true,
        multiple: false
      }
    end

    def remove(name)
      @script << { remove: name }
    end

    def generate(name, with:)
      @script << { generate: name, with: with }
    end

    def in_directory(name)
      @script << { setdir: name }
    end

    def copy_base!(source = nil)
      @script << { copy_base: source }
    end
  end
end
