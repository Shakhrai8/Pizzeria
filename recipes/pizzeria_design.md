# {{PROBLEM}} Pizzeria Multi Class Project

## 1. Describe the Problem

> As a customer
> So that I can check if I want to order something
> I would like to see a list of dishes with prices.

> As a customer
> So that I can order the meal I want
> I would like to be able to select some number of several available dishes.

> As a customer
> So that I can verify that my order is correct
> I would like to see an itemised receipt with a grand total.
> Use the twilio-ruby gem to implement this next one. You will need to use doubles too.

> As a customer
> So that I am reassured that my order will be delivered on time
> I would like to receive a text such as "Thank you! Your order was placed and will be
> delivered before 18:52" after I have ordered.

> As a developer
> I need to make use of Twilio API
> Use security measures for storing Twilio API Keys


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
                             ┌──────────────────────────┐
                             │         Pizzeria         │
                             ├──────────────────────────┤
         ┌──────────────────►│                          ├───────────────┐
         │                   │  - @menu: Menu           │               │
         │                   │                          │               │
         │                   │  - @order: Order         │               │
         │                   │                          │               │
         │                   │  - @customer             │    ┌──────────▼───────────────┐
┌────────┴────────────┐      └─────────────┬────────────┘    │          Menu            │
│      Customer       │                    │                 ├──────────────────────────┤
├─────────────────────┤                    │                 │                          │
│                     │                    │                 │    - @dishes             │
│    @name            │                    │                 │                          │
│    @adress          │                    │                 │                          │
│    @phone_number    │                    │                 │                          │
│                     │      ┌─────────────▼────────────┐    │                          │
└────────▲────────────┘      │          Order           │    └──────────────────────────┘
         │                   ├──────────────────────────┤
         │                   │                          │
         │                   │  - @items                │
         └───────────────────┤                          │
                             │                          │
                             │                          │
                             │                          │
                             └─────────────┬────────────┘
                                           │
                                           │
                                 ┌─────────▼───────────┐
                                 │     Twilio API      │
                                 │                     │
                                 └─────────┬───────────┘
                                           │
                                           │
                               ┌───────────▼──────────────┐
                               │                          │
                               │  environmental variable  │
                               │                          │
                               │                          │
                               │                          │
                               │                          │
                               └──────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Pizzeria
  def initialize
    # Initialize the pizzeria with menu, order, and customer objects
  end

  def display_menu
    # Display the menu with dishes and prices
    # Returns nothing
  end

  def place_order(*selection)
    # Place an order by adding selected dishes to the order object
    # Returns nothing
  end

  def print_receipt
    # Print an itemized receipt for the order
    # Returns nothing
  end

  def send_confirmation_sms
    # Send a confirmation SMS to the customer using the Twilio API
    # Returns nothing
  end
end

class Menu
  def initialize
    # Initialize the menu with a hash of dishes and prices
  end

  def display_menu
    # Display the menu with dishes and prices
    # Returns nothing
  end

  def price_of(dish)
    # Get the price of a specific dish
    # Returns the price as a float or nil if the dish is not available
  end

  def available?(dish)
    # Check if a specific dish is available
    # Returns true if available, false otherwise
  end
end

class Order
  def initialize
    # Initialize the order with an empty hash of items
  end

  def add_item(dish)
    # Add a dish to the order
    # Returns nothing
  end

  def print_receipt(menu)
    # Print an itemized receipt for the order using the menu object
    # Returns nothing
  end
end

class Customer
  def initialize
    # Initialize the customer
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

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

#1 Displaying the menu and placing an order

pizzeria = Pizzeria.new
pizzeria.display_menu
pizzeria.place_order("Margherita", "Pepperoni", "Hawaiian")
pizzeria.print_receipt

#2 Customer interaction with the Pizzeria

customer = Customer.new
customer.view_menu(pizzeria)
customer.place_order(pizzeria, "Vegetarian")
customer.view_receipt(pizzeria)

#3 Multiple orders at different pizzerias

pizzeria1 = Pizzeria.new
pizzeria2 = Pizzeria.new

customer.place_order(pizzeria1, "Margherita")
customer.place_order(pizzeria2, "Pepperoni", "Hawaiian")

customer.view_receipt(pizzeria1)
customer.view_receipt(pizzeria2)

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
#1 Behavior of the Menu class
menu = Menu.new
menu.display_menu
# Output:
# Menu:
# Margherita: $8.99
# Pepperoni: $9.99
# Vegetarian: $9.99
# Hawaiian: $10.99

puts menu.price_of("Pepperoni")
# Output: 9.99

puts menu.available?("Hawaiian")
# Output: true

#2 Behavior of the Order class
order = Order.new
order.add_item("Margherita")
order.add_item("Pepperoni")
order.add_item("Margherita")
order.print_receipt(menu)
# Output:
# Receipt:
# Margherita x 2: $17.98
# Pepperoni x 1: $9.99
# Total: $27.97
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._