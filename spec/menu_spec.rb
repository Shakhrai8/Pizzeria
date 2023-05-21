require 'menu'

RSpec.describe Menu do
  let(:menu) { Menu.new }
  context "#display_menu method" do
    it "returns menu" do
      expected_output = "Menu:\n1. Hunor's special: £12.99\n2. Margherita: £9.99\n3. Vegeterian: £9.99\n4. Hawaiian: £10.99\n"
      expect { menu.display_menu }.to output(expected_output).to_stdout
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