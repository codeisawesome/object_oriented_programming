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
      puts @meal_time + "AM"
    else
      puts @meal_time + "PM"
    end
  end

  def meow
    meal_time = []
    if @meal_time <= 12
      meal_time.push(@meal_time, "AM")
      am = meal_time.join(' ')
    else
      pmtime = @meal_time - 12
      meal_time.push(pmtime, "PM")
      am = meal_time.join(' ')
    end
    puts "My name is " + @name + " and I eat " + @preferred_food + " at #{am}"
  end

end

#Create two instances of Cat class

bob = Cat.new("Bob", "Fish", 12)
dan = Cat.new("Dan", "Shark", 11)
jim = Cat.new("Jim", "Potato", 23)

bob.meow
dan.meow
jim.meow
