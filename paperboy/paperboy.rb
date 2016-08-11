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

  def deliver(start_address, end_address)
    # Depending even or odd, +1 to odd to account extra house
    if @side == "even"
      papertotal = (end_address.to_i - start_address.to_i).abs/2
    else
      papertotal = (end_address.to_i - start_address.to_i).abs/2 + 1
    end

    if papertotal > @quota && @experience == 0
      @earnings = 12.5 + (( papertotal - 50) * 0.5)
      @daypay = 12.5 + (( papertotal - 50) * 0.5)
    elsif papertotal > @quota
      @daypay = @quota * 0.25 + (( papertotal - @quota) * 0.5)
      @earnings += @daypay
    else
      daypay = papertotal*0.25 - 2
      @earnings += daypay
    end

    @experience += papertotal
    @daypay
  end

  def report
    puts "I'm #{ name}, I've delivered #{ experience } papers and I've earned #{ @earnings} so far!"
  end

end
