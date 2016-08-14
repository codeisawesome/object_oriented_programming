require_relative 'tax'

# Shopping list
cash_register = Cash_register.new
puts "************Please input what you'd like to buy,***********************"
puts "*******************eg: 1 book at 12.49*********************************"
puts "*************eg: 2 imported music CD at 14.45 *************************"
puts "*******************write 'end' when done!******************************"

# Gets user input and stores them into an Array
user_input_array = Array.new
input = gets.chomp

while input != "end"
  user_input_array << input
  input = gets.chomp
end

# A method to parse each user entry into [["1", "book", 14.55],...]
def quantity_and_name(array)
  quantity_name_array = []

  array.each do |x|
    holder = []
    holder = x.split(" at ")[0].split(' ', 2)
    holder << x.split(" at ")[1] #splits "1 book at 14.55" => ["1", "book", 14.55]
    quantity_name_array << holder
    end

  return quantity_name_array
end

# The above method is called on user input, [["1", "book", 14.55],...] is created.
quantity_name_array = quantity_and_name(user_input_array)

# [["1", "book", 14.55],...] is use to created instances which are stored into an Array
i = 0
array_of_item_instances = []

quantity_name_array.each do |x|# quantity_name_array = [["1", "book", "14.55"], ...]
  array_of_item_instances << Item.new(*x)
end


cash_register = Cash_register.new

while i <= array_of_item_instances.length
  cash_register.add_item(array_of_item_instances[0])
end

cash_register.subtotal

# 1 book at 12.45
# 1 chocolate bar at 23.54
# 3 imported wine at 24.56


# cash_register.subtotal
#
# cash_register.tax
#
# cash_register.total


## Testing to see how it would work to split strings
# array = []
# x = "1 imported book at 12.49"
# y = x.split(" at ")[0].split(' ', 2)
# y << x.split(" at ")[1]
# array += y
# quantity_name = array[0]
# quantity_name.split(' ', 2)
# h = {}


## testing to see how to create multiple instances using an array
# class Person
#   attr_accessor :first_name, :last_name
#   def initialize(first_name, last_name)
#     @first_name = first_name
#     @last_name = last_name
#   end
# end
#
# b = [["rui", "dong"],["julie","he"]]
# a = []
#
# b.each do |x|
# a << Person.new(*x)
# end
#
# puts a[0].first_name
# puts a[1].first_name
