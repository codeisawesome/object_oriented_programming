class Mars
  attr_reader :width, :length, :map
  def initialize(size_width, size_length)
    @@count = 0
    @@width = size_width.to_i
    @@length = size_length.to_i
    @@map = {}
    ((0..@@width).to_a.product((0..@@length).to_a)).each do |x|
      @@map[x] = 0
    end
  end

  def self.print_currentmap
    (@@map.keys).sort_by{|x,y|[-y,x]}.each do |k|
      print k[0] == @@width ? "#{@@map[k]}\n" : "#{@@map[k]}"
    end
    puts
  end

  def self.count
    return @@count
  end

  private
  def check_conflict(k)
    if !(@@map[k] == 0)
      raise "Ravor Collision!"
    else
      return true
    end
  end

end

class Rover < Mars
  attr_reader :x, :y, :dir, :id
  def initialize(x_coord,y_coord, dir)
    @x = x_coord.to_i
    @y = y_coord.to_i
    @d = dir
    @@count += 1
    @id = @@count
    if(check_conflict([@x,@y]))
      @@map[[@x,@y]] = @id
    end
  end

  public

  def read_instruction(commands)
    commands.each do |x|
      if x.upcase == "L" || x.upcase == "R"
        turn(x)
      else
        move
      end
    end

    puts "#{@x} #{@y} #{@d}"
  end

  private

  def move
    case @d.upcase
    when "N" then
      if(@@map.keys.include?([@x,@y + 1])) && check_conflict([@x,@y + 1])
        @@map[[@x,@y]] = 0
        @y += 1
        @@map[[@x,@y]] = @id
      else
        error_handle
      end
    when "W" then
      if(@@map.keys.include?([@x - 1,@y])) && check_conflict([@x - 1,@y])
        @@map[[@x,@y]] = 0
        @x -= 1
        @@map[[@x,@y]] = @id
      else
        error_handle
      end
    when "S" then
      if(@@map.keys.include?([@x,@y - 1])) && check_conflict([@x,@y - 1])
        @@map[[@x,@y]] = 0
        @y -= 1
        @@map[[@x,@y]] = @id
      else
        error_handle
      end
    when "E" then
      if(@@map.keys.include?([@x + 1,@y])) && check_conflict([@x + 1,@y])
        @@map[[@x,@y]] = 0
        @x += 1
        @@map[[@x,@y]] = @id
      else
        error_handle
      end
    end
  end

  def turn(lor)
    case lor.upcase
    when "L" then
      case @d.upcase
      when "N" then @d = "W"
      when "W" then @d = "S"
      when "S" then @d = "E"
      when "E" then @d = "N"
      end
    when "R" then
      case @d.upcase
      when "N" then @d = "E"
      when "E" then @d = "S"
      when "S" then @d = "W"
      when "W" then @d = "N"
      end
    end
  end

  def error_handle
    raise 'Lost signal of rover'
  end

end

puts "please input plateau size (format = \"width length) must be integer\""
plateausize = gets.chomp!.split
puts "please input rover1 starting position"
rover_1 = gets.chomp!.split
puts "please input instructions for rover1"
commands1 = gets.chomp!.split(//)
puts "please input rover2 starting position"
rover_2 = gets.chomp!.split
puts "please input instructions for rover2"
commands2 = gets.chomp!.split(//)
puts
mars = Mars.new(*plateausize)
puts "plateausize map"
Mars.print_currentmap
rover1 = Rover.new(*rover_1)
puts "ravor1 initial location"
Mars.print_currentmap
rover1.read_instruction(commands1)
puts "\nravor1 location after moving"
Mars.print_currentmap
rover2 = Rover.new(*rover_2)
puts "ravor2 initial location"
Mars.print_currentmap
rover2.read_instruction(commands2)
puts "\nravor2 location after moving"
Mars.print_currentmap
