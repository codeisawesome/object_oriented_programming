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
i = 0
array_of_item_instances = []

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
# [["1", "book", 14.55],...] is use to created instances which are stored into an Array
quantity_name_array = quantity_and_name(user_input_array)
quantity_name_array.each do |x|# quantity_name_array = [["1", "book", "14.55"], ...]
  array_of_item_instances << Item.new(*x)
end

# Adding item to the shopping_cart
while i < array_of_item_instances.length
  cash_register.add_item(array_of_item_instances[i])
  i += 1
end

# Calling for an receipt
cash_register.receipt
