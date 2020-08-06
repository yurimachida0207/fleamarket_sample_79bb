require 'rails_helper'

RSpec.describe Card, type: :model do

  it "customer_idがない場合、無効である" do
    card = Card.new(customer_id: nil)
    card.valid?
    expect(card.errors[:customer_id]).to include("can't be blank")
  end
  
  it "card_idがない場合、無効である" do
    card = Card.new(card_id: nil)
    card.valid?
    expect(card.errors[:card_id]).to include("can't be blank")
  end
end