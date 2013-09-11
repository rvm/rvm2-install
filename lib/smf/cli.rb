require "pluginator"

module Smf
  class Cli
    class Plugin
      def self.handles?(*command)
        command.flatten!
        command.length > 0 && commands.keys.include?(command[0])
      end

      def initialize(rvm2plugins, *command)
        @command = command.flatten
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
      @rvm2plugins.first_ask!("cli", :handles?, @args).new(@rvm2plugins, @args).run
    rescue Pluginator::PluginatorError
      @rvm2plugins.first_ask!("cli", :handles?, "help").new(@rvm2plugins, @args).run
      return 1
    end

  end
end
