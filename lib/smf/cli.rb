require "pluginator"

module Smf
  class Cli
    class Plugin
      def self.handles?(*args)
        args.flatten!
        args.length > 0 && args[0] == command
      end

      def self.command
        name = self.name.split(/::/)
        name.shift(2)
        name.join("/").downcase
      end

      def initialize(rvm2plugins, *args)
        @args = args.flatten
        @rvm2plugins = rvm2plugins
      end
    end

    def self.run(args)
      cli = new(args)
      cli.run
    end

    def initialize(args)
      @args = args
      @rvm2plugins = Pluginator.find("smf", extends: %i{first_ask})
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
