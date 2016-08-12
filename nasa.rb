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
    @x = x
    @y = y
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

end

puts "Please enter the position of the first rover1 ex: 1 2 N"
rover1pos = gets.chomp
rover1pos_format = rover1pos.
rover1 = Rover.new(0,0,"N")
rover1.instructions("LMRMLRM")
rover1
