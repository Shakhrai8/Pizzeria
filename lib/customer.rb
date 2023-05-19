class Customer
  attr_reader :name, :address, :phone_number

  def initialize(name, address, phone_number)
    @name = name
    @address = address
    @phone_number = phone_number
  end

  def view_menu(pizzeria)
    puts "Menu:"
    pizzeria.display_menu
  end

  def place_order(pizzeria, *selection)
    # Place an order at the given pizzeria with the selected dishes
    # Returns nothing
  end

  def view_receipt(pizzeria)
    puts "Receipt for the order placed at #{pizzeria.place_name}:"
    pizzeria.order.print_receipt(pizzeria.menu)
  end
end