require 'order'

RSpec.describe Order do
  let(:menu) { instance_double("Menu") }
  subject(:order) { described_class.new }

  context "adding the item" do
    it "adds pizza to the order" do
      dish = "Hunor's special"
      expect(order.add_item(dish)).to eq(1)
    end

    it "counts how many pizzas are added" do
      dish = "Margherita"
      order.add_item(dish)
      expect(order.add_item(dish)).to eq(2)
    end
  end

  context "receipt method" do
    it "prints the receipt" do
      allow(menu).to receive(:price_of).with("Margherita").and_return(9.99)
      allow(menu).to receive(:price_of).with("Hawaiian").and_return(10.99)

      order.add_item("Margherita")
      order.add_item("Hawaiian")

      result_receipt = "Receipt:\nMargherita x 1: £9.99\nHawaiian x 1: £10.99\nTotal: £20.98\n"
      expect { order.print_receipt(menu)}.to output(result_receipt).to_stdout
    end
  end
end