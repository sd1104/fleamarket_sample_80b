FactoryBot.define do
  factory :images do
    image {File.open("#{Rails.root}/app/assets/images/material/logo/app.png")}
  end
end