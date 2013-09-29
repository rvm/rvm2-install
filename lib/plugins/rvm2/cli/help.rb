class Rvm2::Cli::Help < Rvm2::Cli::Plugin
  def self.description
    "show help screen"
  end

  def run
    plugins = @rvm2plugins["cli"]
    max = plugins.map{|plugin| plugin.command.length }.max
    if @args.empty? || @args[0] == self.class.command
      puts "Welcome to RVM2, available commands:"
    else
      puts "Unknown arguments: #{@args.join(" ")}"
      puts "Available commands:"
    end
    plugins.each do |plugin|
      puts "%#{max}s | %s" % [plugin.command, plugin.description]
    end
    nil
  end
end
