class Smf::Cli::Help < Smf::Cli::Plugin
  def self.description
    "show help screen"
  end

  def run
    commands = @rvm2plugins["cli"].map do |plugin|
      [plugin.command, plugin.description]
    end
    max = commands.map(&:first).map(&:length).max
    help_array = [ "Welcome to RVM2, available commands:" ]
    help_array += commands.map do |command, desc|
      "%#{max}s | %s" % [command, desc]
    end
    puts help_array
  end
end
