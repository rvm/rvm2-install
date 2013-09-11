class Smf::Cli::Welcome < Smf::Cli::Plugin
  def self.handles?(*command)
    return true if super
    command.flatten!
    command.length == 0 || command[0].nil? || command[0] == ""
  end

  def self.commands
    {"welcome" => "show welcome message"}
  end

  def run
    puts <<-MESSAGE
Welcome to RVM2, to get some help run:

    rvm2 help

MESSAGE
  end
end
