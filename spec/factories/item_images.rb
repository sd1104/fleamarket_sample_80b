FactoryBot.define do
  factory :item_image do
    image {File.open("#{Rails.root}/app/assets/images/material/logo/app.png")}
  end
end