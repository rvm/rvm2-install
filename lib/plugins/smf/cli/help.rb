class Smf::Cli::Help
  def self.handles?(*command)
    command.flatten!
    command.length > 0 && command[0] == "help"
  end

  def self.help
    {"help" => "show help screen"}
  end

  def initialize(rvm2plugins, *command)
    @rvm2plugins = rvm2plugins
  end

  def run
    commands = @rvm2plugins["cli"].map{ |plugin| plugin.help.map{|name, value| [name, value] } }.inject(&:+)
    max = commands.map(&:first).map(&:length).max
    help_array = commands.map{ |command, desc| "%#{max}s | %s" % [command, desc] }
    help_array.unshift "Welcome to RVM2, available commands:"
    puts help_array
  end
end
