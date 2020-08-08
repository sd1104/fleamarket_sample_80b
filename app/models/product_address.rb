class ProductAddress < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefecture_code, :address_city, :address_street, 
    presence: true
  validates :phone_number, 
    uniqueness: true
end
