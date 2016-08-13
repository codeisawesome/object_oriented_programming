class Item
  # class << self; attr_accessor :all end
  # @@all = []

  attr_reader :import, :exempt, :base_price

  def initialize(quantity, name, import, exempt, base_price)
    @quantity = quantity.to_i
    @name = name
    @import = import
    @exempt = exempt
    @base_price = base_price.to_f
    # @@all << self
  end

end


class Cash_register

  def initialize
    @shopping_cart = []
    @subtotal = 0
    @tax = 0
    @rounded_amount = 0
  end

  def add_item(item)
    @shopping_cart << item
  end

  def rounding(x)
    @rounded_amount = (x * 20).ceil / 20.0
    puts "$" + sprintf('%.2f', @rounded_amount)
  end

  def tax
    @shopping_cart.each do |x|
      if x.import
        @tax += x.base_price * 0.05
      end
      unless x.exempt
        @tax += x.base_price * 0.10
      end
    end
    rounding(@tax)
  end

  def subtotal
    @shopping_cart.each do |x|
      @subtotal += x.base_price
    end
    rounding(@subtotal)
  end

  def total
     total = @subtotal + @tax
     rounding(total)
  end

end


# Creating cash_register
cash_register = Cash_register.new

# Shopping list
# puts "Please input what you'd like to buy (ex: 1 book at 12.49), press enter if done:"
#
#   def convert_user_input(array)
#     array.each do |x|
#       x.split("at")
#
#
#
#
#   while user_input = gets.chomp
#     if user_input == ""
#       break
#     else
#       magic_machine << user_input.split("at")
#
#       puts "Please input what you'd like to buy, press enter if done:"
#     end
#   end


book = Item.new(1, book, false, true, 12.49) #quantity, name, import, exempt, base_price
music_CD = Item.new(1, music_CD, false, false, 14.99)
chocolate_bar = Item.new(1, chocolate_bar, false, true, 0.85)


cash_register.add_item(book)
cash_register.add_item(music_CD)
cash_register.add_item(chocolate_bar)


# outputting the results of the shopping list
# ObjectSpace.each_object(Cash_register) {|x| p x}
ObjectSpace.each_object(Item) {|x| p x}

cash_register.subtotal

cash_register.tax

cash_register.total
