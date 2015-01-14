Pry.config.prompt = proc do |obj, level, _|
  prompt = ""
  prompt << "#{RUBY_VERSION}"
  # prompt << " on #{Rails.version}" if defined?(Rails)
  "#{prompt} (#{obj})> "
end

Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "from #{exception.backtrace.first}\e[0m"
end

if defined?(Rails)
  require "rails/console/app"
  require "rails/console/helpers"
  TOPLEVEL_BINDING.eval("self").extend ::Rails::ConsoleMethods

  # load models, controllers eagerly; make console work easier
  Rails.application.eager_load!
end

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

begin
  require 'hirb'

  Hirb.enable

  old_print = Pry.config.print
  Pry.config.print = proc do |*args|
    Hirb::View.view_or_page_output(args[1]) || old_print.call(*args)
  end
rescue LoadError => e
  warn e.message
end

# emacs support
Pry.config.correct_indent = false if ENV["EMACS"]

# vim: set ft=ruby:
