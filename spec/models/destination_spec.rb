require 'rails_helper'
describe User do
  describe '#create' do
    it "is valid with all information" do
      destination = build(:destination)
      expect(destination).to be_valid
    end

    it "is invalid without a ship_last_name" do
      destination = build(:destination, ship_last_name: nil)
      destination.valid?
      expect(destination.errors[:ship_last_name]).to include("を入力してください")
    end

    it "is invalid without a ship_first_name" do
      destination = build(:destination, ship_first_name: nil)
      destination.valid?
      expect(destination.errors[:ship_first_name]).to include("を入力してください")
    end

    it "is invalid without a ship_last_name_kana" do
      destination = build(:destination, ship_last_name_kana: nil)
      destination.valid?
      expect(destination.errors[:ship_last_name_kana]).to include("を入力してください")
    end

    it "is invalid without a ship_first_name_kana" do
      destination = build(:destination, ship_first_name_kana: nil)
      destination.valid?
      expect(destination.errors[:ship_first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a phone_number" do
      destination = build(:destination, phone_number: nil)
      destination.valid?
      expect(destination.errors[:phone_number]).to include("を入力してください")
    end

    it "is invalid without a zip_code" do
      destination = build(:destination, zip_code: nil)
      destination.valid?
      expect(destination.errors[:zip_code]).to include("を入力してください")
    end

    it "is invalid without a prefecture" do
      destination = build(:destination, prefecture: nil)
      destination.valid?
      expect(destination.errors[:prefecture]).to include("を入力してください")
    end

    it "is invalid without a address" do
      destination = build(:destination, address: nil)
      destination.valid?
      expect(destination.errors[:address]).to include("を入力してください")
    end

    it "is invalid without a second_address" do
      destination = build(:destination, second_address: nil)
      destination.valid?
      expect(destination.errors[:second_address]).to include("を入力してください")
    end

  end
end