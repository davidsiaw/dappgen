# frozen_string_literal: true

require 'active_support/inflector'

class Dir
  def self.[](params)
    Dir.glob(params, File::FNM_DOTMATCH).reject do |x|
      x.end_with?('/..') || x.end_with?('/.')
    end
  end
end

require 'dappgen/machines/debug_machine'
require 'dappgen/machines/dry_run_machine'
require 'dappgen/machines/execute_machine'

require 'dappgen/dapper_config'
require 'dappgen/interpreter'
require 'dappgen/script'
require 'dappgen/version'
