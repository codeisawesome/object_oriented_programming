# require_relative 'tax'


# Shopping list
puts "Please input what you'd like to buy (ex: 1 book at 12.49), enter 'end' when done:"

  # def convert_user_input(array)
  #   array.each do |x|
  #     quantityname = x.split(" at ")
  #     quantity_name = quantityname[0]
  #     puts quantity_name.split(' ', 2)
  #   end
  # end

user_input_array = Array.new
input = gets.chomp

while input != "end"
  user_input_array << input
  "Please input what you'd like to buy (ex: 1 book at 12.49), press enter if done:"
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

#       end
#     break
#   else
#     user_input_array = []
#     if user_input_array != []
#       user_input_array << user_input
#     else
#       user_input_array
#     puts "Please input what you'd like to buy, press enter if done:"
#   end
#
# end


    # puts convert_array

    #   convert_user_input(convert_array)
    #
    # while user_input != ''
    #   if user_input == ""
    #   convert_array (&method (:convert_user_input)


# array = Array.new
#
# while yn ! "end"
#   array << gets.chomp




## Testing to see how it would work for convert_user_input
# array = []
# x = "1 imported book at 12.49"
# y = x.split(" at ")[0].split(' ', 2)
# y << x.split(" at ")[1]
# array += y
# quantity_name = array[0]
# quantity_name.split(' ', 2)
# h = {}
