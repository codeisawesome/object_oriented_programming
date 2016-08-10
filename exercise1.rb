class Cat
  attr_accessor :name, :preferred_food, :meal_time
  def initialize(name, preferred_food, meal_time)
      @name = name
      @preferred_food = preferred_food
      @meal_time = meal_time
      @two = "number2"
  end
  def number
    puts @two
  end
end
