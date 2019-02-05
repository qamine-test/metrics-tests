class Greeter
    def initialize(@name : String )
    end
  
    def salute
      puts "Hello #{@name}!"
    end
  end
  # This is a comment
  g = Greeter.new("world")
  g.salute
