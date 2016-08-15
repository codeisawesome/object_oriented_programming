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

=begin
Example 1:
1 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85

Output:
1 book : 12.49
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 29.83


Example 2:
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50

Output:
1 imported box of chocolates: 10.50
1 imported bottle of perfume: 54.65
Sales Taxes: 7.65
Total: 65.15


Example 3:
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
1 box of imported chocolates at 11.25


Output:
1 imported bottle of perfume: 32.19
1 bottle of perfume: 20.89
1 packet of headache pills: 9.75
1 imported box of chocolates: 11.85
Sales Taxes: 6.70
Total: 74.68

=end
