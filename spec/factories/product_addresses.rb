FactoryBot.define do

  factory :product_address do
    first_name        {"山田"}
    last_name         {"太郎"}
    first_name_kana   {"ヤマダ"}
    last_name_kana    {"タロウ"}
    postal_code       {"1234567"}
    prefecture_code   {"27"}
    address_city      {"大阪市北区"}
    address_street    {"1-2-3"}
    building_name     {"メゾンFULIMA A101"}
    phone_number      {"09012345678"}
    user
  end

end