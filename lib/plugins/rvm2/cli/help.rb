class Rvm2::Cli::Help < Rvm2::Cli::Plugin
  def self.description
    "show help screen"
  end

  def run
    puts "Unknown arguments: #{@args.join(" ")}" unless asked_for_help?
    list_subcommands
    asked_for_help? ? 0 : 1
  end

private

  def asked_for_help?
    @args.empty? || @args[0] == self.class.command
  end

  def list_subcommands
    plugins = @rvm2plugins["cli"]
    length  = plugins.map{|plugin| plugin.command.length }.max
    puts "Available commands:"
    plugins.each { |plugin| puts format_plugin(plugin, length) }
  end

  def format_plugin(plugin, length)
    "%#{length}s | %s" % [plugin.command, plugin.description]
  end
end
