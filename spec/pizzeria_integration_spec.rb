require 'pizzeria'
require 'menu'
require 'order'
require 'customer'

RSpec.describe "Pizzeria Integration" do
  let(:pizzeria) { Pizzeria.new }

  context "#display_menu method" do
    it "returns menu" do
      #catch the line of code and direct it to terminal
      expect { pizzeria.display_menu }.to output("Menu: \nHunor's special: £12.99\nMargherita: £9.99\nVegeterian: £9.99\nHawaiian: £10.99\n").to_stdout
    end
  end

  describe "#print_receipt method" do
    it "prints the order receipt" do
      #pizzeria.place_order("Margherita", "Hawaiian")
      #expect { pizzeria.print_receipt }.to output("Receipt:\nMargherita x 1: £9.99\nHawaiian x 1: £10.99\nTotal: £20.98\n").to_stdout
    end
  end
end