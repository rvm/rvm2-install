class Rvm2::Cli::Welcome < Rvm2::Cli::Plugin
  def self.handles?(*args)
    return true if super
    args.flatten!
    args.length == 0 || args[0].nil? || args[0] == ""
  end

  def self.description
    "show welcome message"
  end

  def run
    puts <<-MESSAGE
Welcome to RVM2, to get some help run:

    rvm2 help

MESSAGE
  end
end
