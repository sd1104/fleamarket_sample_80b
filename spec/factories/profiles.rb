FactoryBot.define do
  
  factory :profile do
    first_name      {"山田"}
    last_name       {"太郎"}
    first_name_kana {"ヤマダ"}
    last_name_kana  {"タロウ"}
    birthday        {"2020-01-01"}
    user
  end
end