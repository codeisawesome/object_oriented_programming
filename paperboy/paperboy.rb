class Paperboy

  class InitializationException < RuntimeError
  end

  attr_accessor :name, :side
  attr_reader :earnings, :experience

  def initialize(name, side)
    @name = name
    @side = side
    @experience = 0
    @earnings = 0
    @quota = 0
    @daypay = 0

    if side != "odd" && side != "even"
      puts "please put either odd or even for side"
      raise InitializationException.new
    else
    end
  end

  # # WRITER
  # def name=(name)
  #   @name = name
  # end

  def quota
    @quota = @experience.to_i/2 + 50
    @quota
  end

  # def deliver(start_address, end_address)
  #   # Depending even or odd, +1 to odd to account extra house
  #   if @side == "even"
  #     papertotal = (end_address.to_i - start_address.to_i).abs/2
  #   else
  #     papertotal = (end_address.to_i - start_address.to_i).abs/2 + 1
  #   end
  #
  #   if papertotal > @quota && @experience == 0
  #     @earnings = 12.5 + (( papertotal - 50) * 0.5)
  #     @daypay = 12.5 + (( papertotal - 50) * 0.5)
  #   elsif papertotal > @quota
  #     @daypay = @quota * 0.25 + (( papertotal - @quota) * 0.5)
  #     @earnings += @daypay
  #   else
  #     daypay = papertotal*0.25 - 2
  #     @earnings += daypay
  #   end
  #
  #   @experience += papertotal
  #   @daypay
  # end

  def deliver(start_address, end_address)
    papertotal = 0



    if @side == "even"
      (start_address..end_address).each do |x|
        if x.even?
          papertotal += 1
        end
      end
    else
      (start_address..end_address).each do |x|
        if x.odd?
          papertotal += 1
        end
      end
    end

    if papertotal > quota
      @daypay = quota * 0.25 + (( papertotal - quota) * 0.5)
      @earnings += @daypay
    else
      @daypay = papertotal*0.25
      @earnings += @daypay - 2
    end
    @experience += papertotal
    return @daypay
  end

  def report
    puts "I'm #{ name}, I've delivered #{ experience } papers and I've earned #{ @earnings} so far!"
  end

end



tommy = Paperboy.new("Tommy", "even")

puts tommy.quota # => 50
puts tommy.deliver(101, 220) # => 17.5
puts tommy.earnings #=> 17.5
tommy.report # => "I'm Tommy, I've delivered 60 papers and I've earned $17.5 so far!"

#puts tommy.quota # => 80
puts tommy.deliver(1, 150) # => 18.75
puts tommy.earnings #=> 34.25
puts tommy.report # => "I'm Tommy, I've been delivered 135 papers and I've earned $34.25 so far!"
