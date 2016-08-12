# class Mars
#
#   def initialize(height, width)
#     @height = height.to_i
#     @width = width.to_i
#   end
#
#   map_view = Array.new(@height,0) { Array.new(@width, 0) }
#   puts map_view
#
# end


class Rover
  def initialize(x, y, dir)
    @x = x.to_i
    @y = y.to_i
    @dir = dir
  end

  def instructions(commands)
    each_command = commands.split(%r{\s*})
    each_command.each do |x|
      if x == "L" || x == "R"
        turn(x)
      else
        move
      end
    end
  end

  def turn(left_or_right)
    case left_or_right

    when "R"

      case @dir
      when "N" then @dir = "E"
      when "E" then @dir = "S"
      when "S" then @dir = "W"
      when "W" then @dir = "N"
      end

    when "L"

      case @dir
      when "N" then @dir = "W"
      when "W" then @dir = "S"
      when "S" then @dir = "E"
      when "E" then @dir = "N"
      end

    end
  end

  def move
    case @dir
    when "N" then @y += 1
    when "E" then @x += 1
    when "S" then @y -= 1
    when "W" then @x -= 1
    end
  end

  def rov_location
    puts "Rover1 is at #{@x},#{@y} and facing #{@dir}"
  end

end


# User input section
puts "Rover1 start position?(ex: 1 2 N):"
pos1 = gets.chomp.split

puts "Enter moving instructions for Rover1 (ex: LMLMLMLMM):"
mov1 = gets.chomp

puts "Rover2 start position?(ex: 3 3 E):"
pos2 = gets.chomp.split

puts "Rover 2 start position?(ex: 1 2 N):"
mov2 = gets.chomp


# rover1 = Rover.new(1,2,"N")
rover1 = Rover.new(*pos1)
rover1.instructions("LMRMLRM")
rover1.rov_location
