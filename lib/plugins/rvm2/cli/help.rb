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
    plugins.sort(&method(:sort_plugins)).each { |plugin| puts format_plugin(plugin, max) }
    nil
  end

private

  def sort_plugins(p1, p2)
    p1.command <=> p2.command
  end

  def format_plugin(plugin, max)
    "%#{max}s | %s" % [plugin.command, plugin.description]
  end
end
