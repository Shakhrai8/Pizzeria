# Pizza Ordering System
This is a simple pizza ordering system implemented in Ruby. The system allows users to view the menu, add pizzas to their basket, view the receipt, and place an order with their details. The project includes the following classes:

  - Menu: Represents the menu of available pizzas and their prices.
  - Pizzeria: Represents the pizza restaurant and provides methods for displaying the menu and processing orders.
  - Customer: Represents a customer and their order. It allows customers to add pizzas to their order, view the receipt, and place an order by providing their details.
  - Order: Represents an order and keeps track of the selected pizzas and their quantities.

## Installation
To run the pizza ordering system, make sure you have Ruby installed on your system. Clone this repository to your local machine:
`git clone https://github.com/Shakhrai8/Pizzeria.git`

## Usage
Navigate to the project directory:
`cd Pizzeria`
Run the CLI application:
`ruby cli/cli.rb`
You will be presented with a menu of options:

  1. Display Menu: Shows the available pizzas and their prices.
  2. Add Pizza to Basket: Allows you to add a pizza to your order.
  3. View Receipt: Shows the receipt of your order.
  4. Place Order: Places the order and provides your details.
  5. Exit: Exits the application.

Follow the prompts to interact with the system and place your pizza order.

## Testing
The project includes RSpec tests to ensure the correctness of the implemented classes and their methods. To run the tests, make sure you have RSpec installed. If not, you can install it by running:
`gem install rspec`
To run the tests, execute the following command in the project directory:
`rspec`
The tests will be executed, and you will see the results in your terminal.

## Contributing
Contributions are welcome! If you find any issues or would like to suggest improvements, please open an issue or submit a pull request.
