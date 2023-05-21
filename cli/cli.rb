require_relative '../lib/customer'
require_relative '../lib/order'
require_relative '../lib/menu'
require_relative '../lib/pizzeria'

def main_menu
  @customer ||= Customer.new("", "", "")
  @pizzeria ||= Pizzeria.new
  puts "----------------------------------"
  puts "Welcome to Makers Pizza!"
  puts "----------------------------------"
  puts "1. Display Menu"
  puts "2. Add Pizza to Basket"
  puts "3. View Receipt"
  puts "4. Place Order"
  puts "5. Exit"
  puts "----------------------------------"

  print "Enter your choice: "
  choice = gets.chomp.to_i
  puts "----------------------------------"

  case choice
  when 1
    display_menu
  when 2
    add_to_basket
  when 3
    view_receipt
  when 4
    place_order
  when 5
    puts "Goodbye!"
    exit
  else
    puts "Invalid choice. Please try again."
    main_menu
  end
end

def display_menu
  @pizzeria.display_menu
  main_menu
end

def display_menu_basket
  @pizzeria.display_menu
end

def add_to_basket
  display_menu_basket

  print "Enter the number of the pizza you want to add to the basket: "
  pizza_number = gets.chomp.to_i

  if pizza_number >= 1 && pizza_number <= @pizzeria.menu.dishes.length
    pizza = @pizzeria.menu.dishes.keys[pizza_number - 1]
    @customer ||= Customer.new("", "", "")  # Create a new customer if not already present

    # Create a new order if the customer doesn't have one
    @customer.save_order(Order.new) if @customer.order.nil?

    @customer.order.add_item(pizza)
    puts "#{pizza} added to the basket."
  else
    puts "Invalid pizza number. Please try again."
  end

  main_menu
end


def view_receipt
  if @customer && @customer.order && @customer.order.any?
    puts "Receipt:"
    @customer.order.print_receipt(@pizzeria.menu)
  else
    puts "No items in the order. Please add pizzas to the basket."
  end

  main_menu
end

def place_order
  if @customer && @customer.order && @customer.order.any?
    print "Enter your name: "
    name = gets.chomp

    print "Enter your address: "
    address = gets.chomp

    print "Enter your phone number: "
    phone_number = gets.chomp

    @customer.update_customer_details(name, address, phone_number)
    @pizzeria.process_order(@customer)
    @customer.send_order_confirmation(@pizzeria)
  else
    puts "No items in the order. Please add pizzas to the basket."
  end

  main_menu
end


main_menu
