require 'customer'
require 'twilio-ruby'

RSpec.describe Customer do
  let(:pizzeria) { double("Pizzeria") }
  let(:order) { double("Order") }
  let(:name) { "John Doe" }
  let(:address) { "123 Main St" }
  let(:phone_number) { "555-1234" }
  let(:customer) { Customer.new(name, address, phone_number) }

  before do
    allow(pizzeria).to receive(:place_name).and_return("Makers Pizza")
    allow(pizzeria).to receive(:order).and_return(order)
    allow(order).to receive(:add_item)
    allow(customer).to receive(:send_confirmation_sms)
  end

  context "#place_order" do
    let(:selection) { ["Hunor's special", "Margherita"] }

    it "adds items to the order" do
      expect(order).to receive(:add_item).with("Hunor's special").once
      expect(order).to receive(:add_item).with("Margherita").once

      customer.place_order(pizzeria, *selection)
    end
  end

  describe "#send_confirmation_sms" do
    let(:pizzeria_1) { double("Pizzeria", place_name: "Makers Pizza") }
    let(:customer_1) { Customer.new("John Doe", "123 Main St", "555-1234") }
    let(:delivery_time_1) { Time.new(2023, 5, 19, 11, 0, 0) }

    it "sends an order confirmation SMS" do
      # Set up the expectation for Twilio client and message creation
      client = double("Twilio::REST::Client")
      messages = double("Twilio::REST::Messages")  # New double object for messages resource
      message = double("Twilio::REST::Message")
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      allow(client).to receive(:messages).and_return(messages)  # Stub messages method to return messages double
      allow(messages).to receive(:create).and_return(message)  # Stub create method on messages double
    
      # Set up the expectation for the SMS content and recipient
      expected_body = "Thank you, John Doe! Your order from Makers Pizza was placed and will be delivered before 11:00."
      expected_from = "your_twilio_phone_number"
      expected_to = "555-1234"
      allow(message).to receive(:create).with(body: expected_body, from: expected_from, to: expected_to)
    
      # Call the private method under test
      customer_1.send(:send_confirmation_sms, pizzeria_1, delivery_time_1)
    end
    
  end
end
