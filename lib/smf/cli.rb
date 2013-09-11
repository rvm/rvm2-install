require "pluginator"

module Smf
  class Cli
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
    end
  end
end
