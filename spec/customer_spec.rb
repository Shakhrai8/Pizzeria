require 'customer'

RSpec.describe Customer do
  let(:menu) { instance_double('Menu') }
  let(:order) { instance_double('Order') }
  let(:pizzeria) { double('Pizzeria', menu: menu, order: order, display_menu: nil, place_name: 'Makers Pizza') }
  subject(:customer) { described_class.new('John Hannis', '123 Main St', '0178758659') }

  context "isolated test" do
    it "returns name, address, and phone number" do
      expect(customer.name).to eq "John Hannis"
      expect(customer.address).to eq "123 Main St"
      expect(customer.phone_number).to eq "0178758659"
    end
  end

  context "#view_menu using double" do
    it "calls the display_menu method on the pizzeria" do
      expect(pizzeria).to receive(:display_menu)
      customer.view_menu(pizzeria)
    end
  end

  context '#view_receipt method' do
    it 'calls the print_receipt method on the pizzeria' do
      expect(order).to receive(:print_receipt).with(menu)
      customer.view_receipt(pizzeria)
    end
  end
end



