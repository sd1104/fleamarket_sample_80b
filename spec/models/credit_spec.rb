require 'rails_helper'

describe Credit do
  describe '#pay' do
    it "is invalid without a user_id" do
      user = build(:credit, user_id: nil)
      user.valid?
      expect(user.errors[:user_id]).to include()
    end
    it "is invalid without a customer_id" do
      user = build(:credit, customer_id: nil)
      user.valid?
      expect(user.errors[:customer_id]).to include()
    end
    it "is invalid without a credit_id" do
      user = build(:credit, credit_id: nil)
      user.valid?
      expect(user.errors[:credit_id]).to include()
    end
  end
end