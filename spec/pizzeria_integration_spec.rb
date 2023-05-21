require 'pizzeria'
require 'menu'
require 'order'
require 'customer'

RSpec.describe "Pizzeria Integration" do
  let(:pizzeria) { Pizzeria.new }
  let(:customer) { Customer.new("John Doe", "123 Main St", "555-1234") }

  context "#display_menu method" do
    it "returns menu" do
      #catch the line of code and direct it to terminal
      expected_output = "Menu:\n1. Hunor's special: £12.99\n2. Margherita: £9.99\n3. Vegeterian: £9.99\n4. Hawaiian: £10.99\n"
      expect { pizzeria.display_menu }.to output(expected_output).to_stdout
    end
  end

  describe "#process_order" do
    it "adds selected dishes to the order and sends order confirmation" do
      expect(customer).to receive(:send_order_confirmation).with(pizzeria)

      pizzeria.process_order(customer, "Margherita", "Hawaiian")
    end
  end
end