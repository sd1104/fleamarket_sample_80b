class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :text, presence: true, length: { in:1..100 }
end
