# frozen_string_literal: true

module Dappgen
  class Interpreter
    def initialize(script, machine)
      @script = script
      @machine = machine
    end

    def built_script
      @built_script ||= @script.built_script
    end

    def run!
      built_script.each do |statement|
        args = [
          statement.first.first,
          statement.first[1]
        ]

        options = statement.to_a[1..-1].to_h

        args << options unless options.empty?
        @machine.public_send(*args)
      end
    end
  end
end
