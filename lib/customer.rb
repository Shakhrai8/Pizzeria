require 'twilio-ruby'

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

  # *selection is a splat operator which is kinda like an array, 
  # so later on rspec in place of selection you just as much pizza 
  # as u want and it will add up into array.
  def place_order(pizzeria, *selection)
    puts "Placing an order for #{name} at #{pizzeria.place_name}:"
    selection.each do |dish|
      pizzeria.order.add_item(dish)
    end
  end

  def view_receipt(pizzeria)
    puts "Receipt for the order placed at #{pizzeria.place_name}:"
    pizzeria.order.print_receipt(pizzeria.menu)
  end

  private

  def send_order_confirmation(pizzeria)
    delivery_time = Time.now + (60 * 60) # One hour from now

    puts "Thank you, #{name}! Your order was placed and will be delivered before #{delivery_time.strftime("%H:%M")}."
    send_confirmation_sms(pizzeria, delivery_time)
  end

  def send_confirmation_sms(pizzeria, delivery_time)
    begin
      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  
      message = client.messages.create(
        body: "Thank you, #{name}! Your order from #{pizzeria.place_name} was placed and will be delivered before #{delivery_time.strftime("%H:%M")}.",
        from: ENV['TWILIO_PHONE_NUMBER'],
        to: phone_number
      )
  
      puts "SMS confirmation sent to #{phone_number}."
    rescue => e
      puts "Error sending confirmation SMS: #{e.message}"
    end
  end
end

