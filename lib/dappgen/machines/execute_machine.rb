# frozen_string_literal: true

require 'erubis'
require 'fileutils'
require 'hashie'

module Dappgen
  module Machines
    class ExecuteMachine
      def initialize
        @origin_dir = `pwd`.chomp
      end

      def set_thing(thing, opts)
        puts "Generating a #{thing}"

        @thing = thing
        @opts = Hashie::Mash.new(opts[:opts])
        @base_data_dir = File.join(Gem.loaded_specs['dappgen'].full_gem_path, 'data', 'dappgen', 'generators', thing)
        @static_files_dir = File.join(@base_data_dir, 'base')
        @replacer_files_dir = File.join(@base_data_dir, 'replacers')
        @template_files_dir = File.join(@base_data_dir, 'templates')
      end

      def setdir(name)
        @cur_dir_name = name
        puts "Preparing directory '#{name}'"
        FileUtils.mkdir_p name
      end

      def copy_base(source)
        if source.nil?
          puts "Copying static files to '#{@cur_dir_name}'"
          Dir["#{@static_files_dir}/*"].each do |object|
            FileUtils.cp_r object, @cur_dir_name
          end
        else
          `rm -rf .tmp`
          `git clone #{source} .tmp`
          Dir['.tmp/*'].each do |object|
            FileUtils.cp_r object, @cur_dir_name
          end
          `rm -rf .tmp`
        end

        puts "Applying replacers to '#{@cur_dir_name}'"
        Dir["#{@replacer_files_dir}/**/*.erb"].each do |template|

          basename = File.join(@cur_dir_name, template.sub(%r{^#{@replacer_files_dir}/}, '')).sub(/.erb$/, '')
          generator = Erubis::Eruby.new(File.read(template), filename: template)

          FileUtils.mkdir_p File.dirname(basename)

          result = generator.result(@opts)
          File.write(basename, result)
        end
      end

      def remove(file)
        puts "Removing '#{@cur_dir_name}/#{file}'"
        FileUtils.rm_r(File.join(@cur_dir_name, file))
      end

      def generate(file, opts)
        puts "Generating '#{@cur_dir_name}/#{file}'"

        template = File.join(@template_files_dir, opts[:with])

        basename = File.join(@cur_dir_name, file)
        generator = Erubis::Eruby.new(File.read(template), filename: template)

        FileUtils.mkdir_p File.dirname(basename)

        result = generator.result(@opts)
        File.write(basename, result)
      end

      def cleanup(_)
      end
    end
  end
end
