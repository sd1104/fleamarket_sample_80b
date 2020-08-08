class ProductAddress < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code
  
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
  
  belongs_to :user, dependent: :destroy

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefecture_code, :address_city, :address_street, 
    presence: true
  validates :phone_number, 
    uniqueness: true
end
