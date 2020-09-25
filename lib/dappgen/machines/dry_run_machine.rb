# frozen_string_literal: true

require 'yaml'

module Dappgen
  module Machines
    class DryRunMachine
      def set_thing(thing, opts)
        @tree = {}
        @thing = thing
        @opts = Hashie::Mash.new(opts[:opts])
        @base_data_dir = File.join(Gem.loaded_specs['dappgen'].full_gem_path, 'data', 'dappgen', 'generators', thing)
        @static_files_dir = File.join(@base_data_dir, 'base')
        @replacer_files_dir = File.join(@base_data_dir, 'replacers')
        @template_files_dir = File.join(@base_data_dir, 'templates')
      end

      def setdir(name)
        @tree[name] = {}
        @cur_dir_name = name
      end

      def copy_base(arg)
        Dir["#{@static_files_dir}/**/*"].each do |object|
          rel_path = object.sub(%r{^#{@static_files_dir}/}, '')
          branch = @tree[@cur_dir_name]

          levels = rel_path.split('/')
          levels[0..-1].each do |level|
            branch[level] = {} if branch[level].nil?

            branch = branch[level]
          end
        end

        Dir["#{@replacer_files_dir}/**/*"].each do |object|
          rel_path = object.sub(%r{^#{@replacer_files_dir}/}, '').sub(/.erb$/, '')
          branch = @tree[@cur_dir_name]

          levels = rel_path.split('/')
          levels[0..-1].each do |level|
            branch[level] = {} if branch[level].nil?

            branch = branch[level]
          end
        end
      end

      def remove(name)
        rel_path = File.join @cur_dir_name, name
        branch = @tree


        levels = rel_path.split('/')
        levels[0..-2].each do |level|
          branch = branch[level]
        end

        branch.delete(levels[-1])
      end

      def generate(name, opts)
        rel_path = File.join @cur_dir_name, name
        branch = @tree

        levels = rel_path.split('/')
        levels[0..-1].each do |level|
          branch[level] = {} if branch[level].nil?

          branch = branch[level]
        end
      end

      def cleanup(_)
        puts "The following is a #{@thing} that would be generated"
        puts arrayize(@tree).to_yaml
      end

      def arrayize(hash)
        result = []

        hash.each do |k, v|
          if v.empty?
            result << k
          else
            result << { k => arrayize(v) }
          end
        end

        result.sort_by do |x|
          if x.is_a? Hash
            -x.length
          else
            0
          end
        end
      end
    end
  end
end
