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
    quota = @experience.to_i/2 + 50
    quota
  end

  def deliver(start_address, end_address)
    papertotal = (end_address.to_i - start_address.to_i).abs/2 + 1
    @earnings = papertotal
    if @earnings > quota*0.25 && @experience == 0
      @earnings = 12.5 + (( papertotal - 50) * 0.5)
    elsif @earnings > quota*0.25
      @earnings += quota * 0.25 + (( papertotal - quota) * 0.5)
    else
      @earnings += @earnings*0.25 - 2
    end
    @experience += (end_address.to_i - start_address.to_i + 1).abs/2
    @earnings
  end

  def report
    puts "I'm #{ name}, I've delivered #{ experience } papers and I've earned #{ @earnings} so far!"
  end

end
