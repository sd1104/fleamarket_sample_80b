class ProductAddress < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
