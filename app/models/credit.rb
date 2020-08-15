class Credit < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :user, :customer_id, :card_id ,presence: true
end
