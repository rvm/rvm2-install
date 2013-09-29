class Smf::Cli::Plugin
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
