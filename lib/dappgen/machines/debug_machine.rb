# frozen_string_literal: true

module Dappgen
  module Machines
    class DebugMachine
      def set_thing(thing, opts)
        puts "Debugging '#{thing}' generation"
        p ['set_thing', thing, opts]
      end

      def setdir(arg)
        p ['setdir', arg]
      end

      def copy_base(arg)
        p ['copy_base', arg]
      end

      def remove(arg)
        p ['remove', arg]
      end

      def generate(arg, opts)
        p ['generate', arg, opts]
      end

      def cleanup(_)
        p ['cleanup']
      end
    end
  end
end
