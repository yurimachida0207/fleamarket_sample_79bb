require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    it "complete_form" do
      item = build(:item)
      expect(item).to be_valid
    end

    it "is invalid without a item_aaname" do
      item = build(:item, item_name: nil)
      item.valid?
      expect(item.errors[:item_name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      item = build(:item, condition: nil)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a postage" do
      item = build(:item, postage: nil)
      item.valid?
      expect(item.errors[:postage]).to include("can't be blank")
    end

    it "is invalid without a prefecture" do
      item = build(:item, prefecture: nil)
      item.valid?
      expect(item.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a preparation" do
      item = build(:item, preparation: nil)
      item.valid?
      expect(item.errors[:preparation]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is valid with a item_name that has less than 40 characters" do
      item = build(:item, item_name: "a"*40 )
      expect(item).to be_valid
    end

    it "is invalid with a description that has more than 1001 characters" do
      item = build(:item, description: "a"*1001 )
      item.valid?
      expect(item.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end

    it "is valid with a password that has more than 6 characters" do
      item = build(:item, description: "a"*1000 )
      expect(item).to be_valid
    end

    it "is invalid with a item_name that has more than 41 characters" do
      item = build(:item, item_name: "a"*41 )
      item.valid?
      expect(item.errors[:item_name]).to include("is too long (maximum is 40 characters)")
    end

    it "is valid with a password that has more than 40 characters" do
      item = build(:item, item_name: "a"*40 )
      expect(item).to be_valid
    end

    it "is invalid with a price that has less than 299" do
      item = build(:item, price: 299 )
      item.valid?
      expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "is valid with a price that has more than 300 characters" do
      item = build(:item, price: 300 )
      expect(item).to be_valid
    end

    it "is invalid with a item_name that has more than 10000000" do
      item = build(:item, price: 10000000 )
      item.valid?
      expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it "is valid with a price that has less than 9999999" do
      item = build(:item, price: 9999999 )
      expect(item).to be_valid
    end

  end
end