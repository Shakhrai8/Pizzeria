require 'customer'

RSpec.describe Customer do
  let(:pizzeria) { double("Pizzeria") }
  let(:menu) { double("Menu") }
  let(:order) { double("Order") }
  let(:name) { "John Doe" }
  let(:address) { "123 Main St" }
  let(:phone_number) { "555-1234" }
  let(:customer) { Customer.new(name, address, phone_number) }

  before do
    allow(pizzeria).to receive(:place_name).and_return("Makers Pizza")
    allow(pizzeria).to receive(:menu).and_return(menu)
    allow(pizzeria).to receive(:order).and_return(order)
    allow(pizzeria).to receive(:process_order) # Stub process_order method
    allow(order).to receive(:add_item).with("Hunor's special")
    allow(order).to receive(:add_item).with("Margherita")
    allow(menu).to receive(:available?).and_return(true)
  end
  
  
  

  describe "#place_order" do
    #let(:selection) { ["Hunor's special", "Margherita"] }

    #it "places an order for selected dishes" do
      #expect(order).to receive(:add_item).with("Hunor's special")
      #expect(order).to receive(:add_item).with("Margherita")

      #customer.place_order(pizzeria, *selection)
    #end

    #it "sends an order confirmation SMS" do
      #delivery_time = Time.new(2023, 5, 19, 11, 0, 0)
      #allow(Time).to receive(:now).and_return(delivery_time)
      
      #expect(customer).to receive(:send_confirmation_sms).with(pizzeria, delivery_time)

      #customer.place_order(pizzeria, *selection)
    #end
  end
end

