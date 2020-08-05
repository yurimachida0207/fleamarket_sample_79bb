FactoryBot.define do
  factory :item do
    item_name             {"fukinoto"}
    description           {"delicious"}
    condition_id          {1}
    postage_payer         {1}
    prefecture_id         {1}
    preparation_id        {1}
    price                 {3000}
    category_id { FactoryBot.create(:category).id }
    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end
end