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
  end

  context "#place_order" do
    let(:selection) { ["Hunor's special", "Margherita"] }

    it "adds items to the order" do
      expect(order).to receive(:add_item).with("Hunor's special").once
      expect(order).to receive(:add_item).with("Margherita").once

      customer.place_order(pizzeria, *selection)
    end
  end

  describe "private methods" do
    let(:pizzeria_1) { double("Pizzeria", place_name: "Makers Pizza") }
    let(:customer_1) { Customer.new("John Doe", "123 Main St", "555-1234") }
    let(:delivery_time_1) { Time.new(2023, 5, 19, 11, 0, 0) }

    before do
      allow_any_instance_of(Customer).to receive(:send_confirmation_sms).and_call_original
    end

    describe "#send_confirmation_sms" do
      it "sends an order confirmation SMS" do
        client = double("Twilio::REST::Client")
        messages = double("Twilio::REST::Messages")
        message = double("Twilio::REST::Message")
        allow(Twilio::REST::Client).to receive(:new).and_return(client)
        allow(client).to receive(:messages).and_return(messages)
        allow(messages).to receive(:create).and_return(message)

        expected_body = "Thank you, John Doe! Your order from Makers Pizza was placed and will be delivered before 11:00."
        expected_from = "your_twilio_phone_number"
        expected_to = "555-1234"
        expect(messages).to receive(:create).with(body: expected_body, from: "+12543308011", to: expected_to)

        customer_1.send(:send_confirmation_sms, pizzeria_1, delivery_time_1)
      end
    end
  end
end
