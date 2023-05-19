class Customer
  attr_reader :name, :address, :phone_number

  def initialize(name, address, phone_number)
    @name = name
    @address = address
    @phone_number = phone_number
  end

  def view_menu(pizzeria)
    # View the menu of the given pizzeria
    # Returns nothing
  end

  def place_order(pizzeria, *selection)
    # Place an order at the given pizzeria with the selected dishes
    # Returns nothing
  end

  def view_receipt(pizzeria)
    # View the receipt of the order placed at the given pizzeria
    # Returns nothing
  end
end