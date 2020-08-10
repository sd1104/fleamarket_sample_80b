class Item < ApplicationRecord
  belongs_to :category, dependent: :destroy
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
  has_many :item_images, dependent: :destroy
  belongs_to :user, dependent: :destroy, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_charge


  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :condition, presence: true
  validates :delivery_charge, presence: true
  validates :derivery_origin, presence: true
  validates :delivery_date, presence: true
  validates :category_id, presence: true

 

  def self.search(search)
    if search
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
