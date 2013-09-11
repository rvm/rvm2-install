class Smf::Cli::Help < Smf::Cli::Plugin
  def self.description
    "show help screen"
  end

  def run
    plugins = @rvm2plugins["cli"]
    max = plugins.map{|plugin| plugin.command.length }.max
    puts "Welcome to RVM2, available commands:"
    plugins.each do |plugin|
      puts "%#{max}s | %s" % [plugin.command, plugin.description]
    end
  end
end
