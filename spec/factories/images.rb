FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/spec/images/test_penguin.png")}
    item
  end
end
