class Rvm2::Cli::Plugin
  def self.handles?(*args)
    args.flatten!
    args.length > 0 && args[0] == command
  end

  def self.command
    self.name.split(/::/).last.downcase
  end

  def initialize(rvm2plugins, *args)
    @args = args.flatten
    @rvm2plugins = rvm2plugins
  end
end
