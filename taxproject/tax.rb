class Item
  # class << self; attr_accessor :all end
  # @@all = []

  attr_reader :import, :exempt, :base_price

  def initialize(name, import, exempt, base_price)
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
  end

  def add_item(item)
    @shopping_cart << item
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
    puts @tax
  end

  def subtotal
    @shopping_cart.each do |x|
      @subtotal += x.base_price
    end
    puts @subtotal
  end

end


# Creating cash_register
cash_register = Cash_register.new

# Shopping list
book = Item.new(book, false, false, 12.49)
music_CD = Item.new(music_CD, false, false, 14.99)
chocolate_bar = Item.new(chocolate_bar, false, false, 0.85)


cash_register.add_item(book)
cash_register.add_item(music_CD)
cash_register.add_item(chocolate_bar)


# outputting the results of the shopping list
ObjectSpace.each_object(Cash_register) {|x| p x}
ObjectSpace.each_object(Item) {|x| p x}

cash_register.subtotal

cash_register.tax
