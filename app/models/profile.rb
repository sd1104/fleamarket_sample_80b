class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy

  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA = /\A[ァ-ヶー－]+\z/

  validates :first_name,      presence: true, format:{with: VALID_NAME, message:"は全角で入力してください"}
  validates :last_name,       presence: true, format:{with: VALID_NAME, message:"は全角で入力してください"}
  validates :first_name_kana, presence: true, format:{with: VALID_NAME_KANA, message:"は全角カタカナで入力してください"}
  validates :last_name_kana,  presence: true, format:{with: VALID_NAME_KANA, message:"は全角カタカナで入力してください"}
  validates :birthday,        presence: true
end