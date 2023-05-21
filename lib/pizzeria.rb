require 'twilio-ruby'

class Pizzeria
  attr_reader :place_name, :menu, :order, :customer

  def initialize(place_name = "Makers Pizza")
    @place_name = place_name
    @menu = Menu.new
    @order = Order.new
    @customer = nil
    configure_twilio
  end

  def display_menu
    @menu.display_menu
  end

  def process_order(customer, *selection)
    selection.each do |dish|
      if menu.available?(dish)
        order.add_item(dish)
        puts "Added #{dish} to the order."
      else
        puts "Sorry, #{dish} is not available."
      end
    end
    customer.send_order_confirmation(self)
  end

  def print_receipt
    @order.print_receipt(@menu)
  end

  private 

  def configure_twilio
    Twilio.configure do |config|
      config.account_sid = ENV['TWILIO_ACCOUNT_SID']
      config.auth_token = ENV['TWILIO_AUTH_TOKEN']
    end
  end
end

