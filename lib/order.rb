class Order
  attr_reader :items
  def initialize
    @items = {}
  end

  def add_item(dish)
    # This line initializes the quantity of the dish in the @items hash to 0 if it doesn't exist yet. 
    @items[dish] ||=0
    # This line increments the quantity of the dish in the @items hash by 1.
    @items[dish] += 1
    # Each dish serves as the key in the hash, and the corresponding value represents the quantity. This allows us to easily add multiple quantities of the same dish to the order.
  end

  def print_receipt(menu)
    puts "Receipt:"
    total = 0
    @items.each do |dish, quantity|
      price = menu.price_of(dish) * quantity
      puts "#{dish} x #{quantity}: £#{price}"
      total += price
    end
    puts "Total: £#{total}"
  end
  
  def any?
    !@items.empty?
  end
end
