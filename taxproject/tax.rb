class Item

  attr_accessor :name, :quantity, :base_price

  def initialize(quantity, name, base_price)
    @quantity = quantity.to_i
    @name = name.to_s
    @base_price = base_price.to_f
  end

end


class Cash_register


  attr_accessor :shopping_cart, :subtotal, :tax, :total
  def initialize
    @shopping_cart = []
    @subtotal = 0.00
    @tax = 0.00
    @rounded_amount = 0.00
    @total = 0.00
  end

# This method each item into the array @shopping_cart
  def add_item(item)
    @shopping_cart << item
  end

# This method rounds up amounts to nearest 0.05
  def rounding(x)
    x = (x * 20).ceil / 20.0
    x = "$" + sprintf('%.2f', x)
    x
  end

# This method calculates tax depending on if the word imported, bar or box are prsent
  def tax
    @shopping_cart.each do |x|
      if (x.name).include?("imported")
        @tax += x.quantity * x.base_price * 0.05
      end
      unless (x.name).include?("bar") || x.name.include?("box")
        @tax += x.quantity * x.base_price * 0.10
      end
    end
    @total += @tax
    puts "Sales Taxes: " + rounding(@tax)
  end

# This method calculates the subtotal
  def total
    @shopping_cart.each do |x|
      @subtotal += x.base_price * x.quantity
    end
    @total += @subtotal
    puts "Total: " + rounding(@total)
  end

# This method prints out a receipt
  def receipt
    @shopping_cart.each do |x|
      str_pt_1 = [x.quantity, x.name]*" " + ":"
      str_pt_2 = x.base_price.to_s
      puts str_pt_1 + " " + str_pt_2
    end
    s = self.tax #don't know how to run method to self without returning a value to console
    t = self.total
  end
end
