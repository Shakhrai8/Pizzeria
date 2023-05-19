require 'customer'

RSpec.describe Customer do
  let(:customer_1) {Customer.new("Eugene", "West Ham, 18", "0175674353")}
  context "isolated test" do
    it "returns name, address and phone number" do
      expect(customer_1.name).to eq "Eugene"
      expect(customer_1.address).to eq "West Ham, 18"
      expect(customer_1.phone_number).to eq "0175674353"
    end
  end
end