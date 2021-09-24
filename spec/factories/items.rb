FactoryBot.define do
  factory :item do
    # image             {Faker::Lorem.sentence}
    item_name         {"名前"}
    item_description  {"説明"}
    item_category_id  {2}
    item_state_id     {2}
    shipping_cost_id  {2}
    prefecture_id     {2}
    shipping_day_id   {2}
    price             {2000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end