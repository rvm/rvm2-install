class Rvm2::Cli::Install < Rvm2::Cli::Plugin
  def self.description
    "installs software"
  end

  def run
    return help unless @args.first
    install
  rescue Pluginator::MissingType
    help error: true
  rescue Pluginator::MissingPlugin
    puts "Do not know how to install: #{@args.first}"
    help error: true
  end

protected

  def install
    @rvm2plugins.first_ask!("lifecycle", :handles?, *@args).new(@rvm2plugins, @args).install
  end

  def help(error: nil)
    list
    error ? 1 : 0
  end

  def list
    plugins = @rvm2plugins["lifecycle"]
    if
      plugins
    then
      list_available
    else
      puts "Do not know yet how to install software, install some plugins, eg. `gem install rvm2-#{@args.first||"mri"}`."
    end
  end

private

  def list_available(plugins)
    puts "Available software:"
    length  = plugins.map{|plugin| plugin.software_name.length }.max
    plugins.each { |plugin| puts format_plugin(plugin, length) }
  end

  def format_plugin(plugin, length)
    "%#{length}s | %s" % [plugin.software_name, plugin.handles]
  end
end
