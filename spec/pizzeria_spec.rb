require 'pizzeria'
require 'twilio-ruby'

RSpec.describe Pizzeria do
  let(:menu_double) { instance_double(Menu) }
  let(:pizzeria) { Pizzeria.new }

  before do
    allow(Menu).to receive(:new).and_return(menu_double)
  end

  describe "#display_menu" do
    it "calls the display_menu method of the menu" do
      expect(menu_double).to receive(:display_menu)
      pizzeria.display_menu
    end
  end
end
