class Paperboy

  class InitializationException < RuntimeError
  end

  attr_accessor :name, :experience, :side
  attr_reader :earnings

  def initialize(name, experience, side, earnings)
    if @name == "bob"
      puts "please put either odd or even for side"
      raise InitializationException.new
    else
      @name = name
      @experience = experience
      @side = side
      @earnings = earnings
    end
  end

  # def quota
  #   quota = @experience/2 + 50
  # end
  #
  # def deliver(start_address, end_address)

end
