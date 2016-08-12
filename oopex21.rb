class Person

  def initialize(name)
    @name = name
  end

  def greeting
    "Hi, my name is #{@name}"
  end
end


class Student < Person
  def learn
    "I get it!"
  end
end

class Instructor < Person
  def teach
    "everything in Ruby is an Object"
  end
end

# 6. Create an instance of Instructor whose name is "Chris" and call his greeting.
chris = Instructor.new("Chris")
christina = Student.new("Christina")

# 7. Create an instance of Student whose name is "Cristina" and call her greeting.
puts chris.greeting
puts christina.greeting

# 8. Calling learn on Student
puts chris.teach
puts christina.learn

# 8. Invert the calls above, they won't work because they are from different classes
puts chris.learn
puts christ.learn
