# require_relative 'tax'

# Shopping list
puts "Please input what you'd like to buy (ex: 1 book at 12.49), enter 'end' when done:"

user_input_array = Array.new
input = gets.chomp

while input != "end"
  user_input_array << input
  puts "Please input what you'd like to buy,"
  puts "eg: 1 book at 12.49;"
  puts "eg: 2 imported music CD at press enter if done:"
  input = gets.chomp
end

def quantity_and_name(array)
  quantity_name_array = []
  array.each do |x|
    holder = []
    holder = x.split(" at ")[0].split(' ', 2)
    holder << x.split(" at ")[1] #splits "1 book at 14.55" => [["1", "book"]], 14.55]
    quantity_name_array << holder
  end
  print quantity_name_array
  return quantity_name_array
end

quantity_and_name(user_input_array)

i = 0

while i <= user_input_array
  item


## Testing to see how it would work to split strings
# array = []
# x = "1 imported book at 12.49"
# y = x.split(" at ")[0].split(' ', 2)
# y << x.split(" at ")[1]
# array += y
# quantity_name = array[0]
# quantity_name.split(' ', 2)
# h = {}
