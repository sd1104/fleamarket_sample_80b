class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :product_address, dependent: :destroy
  has_one :credit, dependent: :destroy

  validates :nickname,
    presence: true, length: { maximum: 6 }
end
