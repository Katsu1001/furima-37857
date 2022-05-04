FactoryBot.define do
  factory :item do
    association :user

    name              {'test'}
    introduction      {'説明書き'}
    category_id       {1}
    condition_id      {1}
    delivery_fee_id   {1}
    shipping_area_id  {1}
    days_to_ship_id   {1}
    price             {1000}


    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
    end
end