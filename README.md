# Pizza Ordering System
This is a simple pizza ordering system implemented in Ruby. The system allows users to view the menu, add pizzas to their basket, view the receipt, and place an order with their details. The project includes the following classes:

  - Menu: Represents the menu of available pizzas and their prices.
  - Pizzeria: Represents the pizza restaurant and provides methods for displaying the menu and processing orders.
  - Customer: Represents a customer and their order. It allows customers to add pizzas to their order, view the receipt, and place an order by providing their details.
  - Order: Represents an order and keeps track of the selected pizzas and their quantities.

## Installation
To run the pizza ordering system, make sure you have Ruby installed on your system. Clone this repository to your local machine:

`git clone https://github.com/Shakhrai8/Pizzeria.git`

## Setup
Before running the pizza ordering system, you need to set up the required Twilio configuration. Follow these steps:

  1. Sign up for a Twilio account at https://www.twilio.com/signup.
  2. Once you have an account, access the Twilio Console and obtain your Account SID and Auth Token.
  3. In your terminal or command prompt, set the environment variables for your Twilio Account SID and Auth Token:
  
  `export TWILIO_ACCOUNT_SID=your_account_sid`
  `export TWILIO_AUTH_TOKEN=your_auth_token`
  
  Replace your_account_sid and your_auth_token with your actual Twilio credentials.
  4. Save the environment variables in your local shell configuration file (e.g., .bashrc, .zshrc) for persistent configuration.

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
The project includes RSpec tests to ensure the correctness of the implemented classes and their methods. 
To run the tests, make sure you have RSpec installed. 
If not, you can install it by running:

`gem install rspec`

To run the tests, execute the following command in the project directory:

`rspec`

The tests will be executed, and you will see the results in your terminal.

## Contributing
Contributions are welcome! If you find any issues or would like to suggest improvements, please open an issue or submit a pull request.

## License
This project is licensed under the MIT License.
