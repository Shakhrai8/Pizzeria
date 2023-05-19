class Pizzeria
  attr_reader :place_name, :menu, :order, :customer

  def initialize(place_name = "Makers Pizza")
    @place_name = place_name
    @menu = Menu.new
    @order = Order.new
    @customer = nil
    #configure_twilio
  end

  def display_menu
    @menu.display_menu
  end

  def place_order(customer, *selection)
    # Place an order by adding selected dishes to the order object
    # Returns nothing
  end

  def print_receipt
    @order.print_receipt(@menu)
  end

  def send_confirmation_sms
    # Send a confirmation SMS to the customer using the Twilio API
    # Returns nothing
  end
end