module SMF
  class CLI
    def self.run(args)
      cli = new(args)
      cli.run
    end
    def initialize(args)
      @args = args
    end
    def run
      puts "In the woods: #{@args*" "}"
    end
  end
end
