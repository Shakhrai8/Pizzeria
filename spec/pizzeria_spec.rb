require 'pizzeria'
require 'twilio-ruby'

RSpec.describe Pizzeria do
  let(:menu_double) { instance_double(Menu) }
  let(:order_double) { instance_double(Order) }
  let(:customer) { instance_double(Customer) }
  let(:customer_double) { instance_double(Customer) }
  let(:pizzeria) { Pizzeria.new }

  describe "#display_menu" do
    it "calls the display_menu method of the menu" do
      allow(Menu).to receive(:new).and_return(menu_double)
      expect(menu_double).to receive(:display_menu)
      pizzeria.display_menu
    end
  end

  describe "#process_order" do
    context "when dishes are available" do
      it "adds selected dishes to the order" do
        allow(Menu).to receive(:new).and_return(menu_double)
        allow(order_double).to receive(:items).and_return([])
        allow(Order).to receive(:new).and_return(order_double)

        selection = ["Margherita", "Hawaiian"]

        allow(menu_double).to receive(:available?).and_return(true)
        allow(order_double).to receive(:add_item)

        expect(order_double).to receive(:add_item).with("Margherita").once
        expect(order_double).to receive(:add_item).with("Hawaiian").once

        pizzeria.process_order(customer_double, *selection)
      end
    end
  end
end
