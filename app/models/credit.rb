class Credit < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :user, :customer_id, :credit_id ,presence: true
end
