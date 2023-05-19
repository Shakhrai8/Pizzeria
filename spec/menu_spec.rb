require 'menu'

RSpec.describe Menu do
  let(:menu) { Menu.new }
  context "#display_menu method" do
    it "returns menu" do
      expect { menu.display_menu }.to output("Menu: \nHunor's special: £12.99\nMargherita: £9.99\nVegeterian: £9.99\nHawaiian: £10.99\n").to_stdout
    end
  end

  context "#price_of method" do
    it "returns the price of a dish" do
      expect(menu.price_of("Hunor's special")).to eq(12.99)
    end
  end

  describe "#available?" do
    it "checks dish availability" do
      expect(menu.available?("Hunor's special")).to be_truthy
      expect(menu.available?("BBQ Chicken")).to be_falsey
    end
  end
end