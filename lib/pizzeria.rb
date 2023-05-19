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