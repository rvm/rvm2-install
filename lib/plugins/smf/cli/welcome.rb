class Smf::Cli::Welcome
  def self.handles?(*command)
    command.flatten!
    command.length == 0 || command[0].nil? || command[0] == "" || command[0] == "welcome"
  end

  def self.help
    {"welcome" => "show welcome message"}
  end

  def initialize(rvm2plugins, *command)
    @rvm2plugins = rvm2plugins
  end

  def run
    puts <<-MESSAGE
Welcome to RVM2, to get some help run:

    rvm2 help

MESSAGE
  end
end
