# frozen_string_literal: true

module Dappgen
  module Machines
    class DebugMachine
      def setdir(arg)
        p 'setdir', arg
      end

      def copy_base(arg)
        p 'copy_base', arg
      end

      def remove(arg)
        p 'remove', arg
      end

      def generate(arg, opts)
        p 'generate', arg, opts
      end
    end
  end
end
