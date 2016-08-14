class Item

  attr_accessor :name, :quantity, :base_price

  def initialize(quantity, name, base_price)
    @quantity = quantity.to_i
    @name = name.to_s
    @base_price = base_price.to_f

  end

end


class Cash_register

  attr_accessor :shopping_cart, :subtotal, :tax 
  def initialize
    @shopping_cart = []
    @subtotal = 0
    @tax = 0
    @rounded_amount = 0
  end

# This method each item into the array @shopping_cart
  def add_item(item)
    @shopping_cart << item
  end

# This method rounds up amounts to nearest 0.05
  def rounding(x)
    @rounded_amount = (x * 20).ceil / 20.0
    puts "$" + sprintf('%.2f', @rounded_amount)
  end

# This method calculates tax depending on if the word imported, bar or box are prsent
  def tax
    @shopping_cart.each do |x|
      if (x.name).include?("imported")
        @tax += x.base_price * 0.05
      end
      unless (x.name).include?("bar") || x.name.include?("box")
        @tax += x.base_price * 0.10
      end
    end
    rounding(@tax)
  end

# This method calculates the subtotal
  def subtotal
    @shopping_cart.each do |x|
      @subtotal += x.base_price
    end
    rounding(@subtotal)
  end

# This method calculates the total
  def total
     total = @subtotal + @tax
     rounding(total)
  end

end


# Creating cash_register
# cash_register = Cash_register.new




# book = Item.new(1, "book", 12.49) #quantity, name, import, exempt, base_price
# music_CD = Item.new(1, "music CD", 14.99)
# chocolate_bar = Item.new(1, "chocolate bar", 0.85)


# cash_register.add_item(book)
# cash_register.add_item(music_CD)
# cash_register.add_item(chocolate_bar)


# outputting the results of the shopping list
# ObjectSpace.each_object(Cash_register) {|x| p x}
# ObjectSpace.each_object(Item) {|x| p x}


# cash_register.subtotal
#
# cash_register.tax
#
# cash_register.total
