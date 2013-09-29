require "pluginator"

module Rvm2
  class Cli
    def self.run(args)
      cli = new(args)
      cli.run
    end

    def initialize(args)
      @args = args
      @rvm2plugins = Pluginator.find("rvm2", extends: %i{first_ask})
    end

    def run
      plugin = @rvm2plugins.first_ask("cli", :handles?, @args)
      if plugin
        plugin.new(@rvm2plugins, @args).run
      else
        plugin = @rvm2plugins.first_ask("cli", :handles?, "help")
        plugin.new(@rvm2plugins, @args).run
        1
      end
    end
  end
end

require_relative "cli/plugin"
