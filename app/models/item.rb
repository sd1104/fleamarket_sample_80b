class Item < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
  has_many :item_images, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_origin_id, presence: true
  validates :delivery_date_id, presence: true
  validates :category_id, presence: true
end
