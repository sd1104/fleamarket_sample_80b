FactoryBot.define do
  
  factory :item do

    name                    {"時計"}
    introduction            {"100円均一の時計です"}
    price                   {300}
    condition_id            {8}
    delivery_charge_id      {1}
    delivery_origin_id      {2}
    delivery_date_id        {3}
    brand                   {"時計"}
    category_id
    
    after(:build) do |item|
      item.item_images << build(:item_image)
    end

  end
end