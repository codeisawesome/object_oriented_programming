#created a Cat class with name, preferred_food, meal_time
class Cat

  attr_accessor :name, :preferred_food, :meal_time

  def initialize(name, preferred_food, meal_time)
      @name = name
      @preferred_food = preferred_food
      @meal_time = meal_time
  end

  def eats_at
    if @meal_time < 12
      eats = "#{@meal_time} AM"
    else
      eats = "#{@meal_time} PM"
    end
    return eats
  end

  def meow
    puts "My name is " + @name + " and I eat " + @preferred_food + " at #{eats_at}"
  end

end

#Create two instances of Cat class

bob = Cat.new("Bob", "Fish", 12)
dan = Cat.new("Dan", "Shark", 11)
jim = Cat.new("Jim", "Potato", 23)

bob.meow
dan.meow
jim.meow
