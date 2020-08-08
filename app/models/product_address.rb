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
    uniqueness: true,
    format: { with: /\A\d{10,11}\z/, message: "はハイフンなし、半角数字で入力してください" }
  validates :first_name, :last_name,
    numericality: false,
    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は全角で入力してください" }
  validates :first_name_kana, :last_name_kana,
    numericality: false,
    format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください。" }
  validates :postal_code,
    format: { with: /\A\d{7}\z/, message: "はハイフンなし、半角数字のみの７桁で入力してください" }
end
