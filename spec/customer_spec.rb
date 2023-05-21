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

  describe "#send_confirmation_sms" do
    let(:pizzeria_1) { double("Pizzeria", place_name: "Makers Pizza") }
    let(:customer_1) { Customer.new("John Doe", "123 Main St", "555-1234") }
    let(:delivery_time_1) { Time.new(2023, 5, 19, 11, 0, 0) }

    context "when Twilio client raises an error" do
      it "handles the error and logs an error message" do
        error_message = "Twilio client error"
        allow(Twilio::REST::Client).to receive(:new).and_raise(error_message)

        expect {
          customer_1.send(:send_confirmation_sms, pizzeria_1, delivery_time_1)
        }.to output("Error sending confirmation SMS: #{error_message}\n").to_stdout
      end
    end

    context "when Twilio message creation raises an error" do
      it "handles the error and logs an error message" do
        client = double("Twilio::REST::Client")
        allow(Twilio::REST::Client).to receive(:new).and_return(client)
        messages = double("Twilio::REST::Messages")
        allow(client).to receive(:messages).and_return(messages)
        error_message = "Twilio message creation error"
        allow(messages).to receive(:create).and_raise(error_message)

        expect {
          customer_1.send(:send_confirmation_sms, pizzeria_1, delivery_time_1)
        }.to output("Error sending confirmation SMS: #{error_message}\n").to_stdout
      end
    end
  end
end
