require 'customer'
require 'twilio-ruby'


RSpec.describe Customer do
  let(:name) { "John Doe" }
  let(:address) { "123 Main St" }
  let(:phone_number) { "555-1234" }
  let(:customer) { Customer.new(name, address, phone_number) }

  describe "#send_confirmation_sms" do
    let(:pizzeria) { double("Pizzeria", place_name: "Makers Pizza") }
    let(:delivery_time) { Time.new(2023, 5, 21, 11, 0) }

    it "sends an order confirmation SMS" do
      expected_body = "Thank you, John Doe! Your order from Makers Pizza was placed and will be delivered before 11:00."
      expected_from = ENV['TWILIO_PHONE_NUMBER']
      expected_to = "555-1234"

      client = double("Twilio::REST::Client")
      messages = double("Twilio::REST::Messages")
      allow(client).to receive(:messages).and_return(messages)
      allow(Twilio::REST::Client).to receive(:new).and_return(client)

      expect(messages).to receive(:create).with(body: expected_body, from: expected_from, to: expected_to)

      customer.send_confirmation_sms(pizzeria, delivery_time)
    end

    context "when Twilio client raises an error" do
      it "handles the error and logs an error message" do
        allow(Twilio::REST::Client).to receive(:new).and_raise("Twilio client error")

        expect { customer.send_confirmation_sms(pizzeria, delivery_time) }.to output("Error sending confirmation SMS: Twilio client error\n").to_stdout
      end
    end

    context "when Twilio message creation raises an error" do
      it "handles the error and logs an error message" do
        client = double("Twilio::REST::Client")
        allow(client).to receive(:messages).and_raise("Twilio message creation error")
        allow(Twilio::REST::Client).to receive(:new).and_return(client)

        expect { customer.send_confirmation_sms(pizzeria, delivery_time) }.to output("Error sending confirmation SMS: Twilio message creation error\n").to_stdout
      end
    end
  end
end

