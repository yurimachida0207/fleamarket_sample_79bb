class Destination < ApplicationRecord
  belongs_to :user
  validates :ship_last_name, :ship_first_name, :ship_last_name_kana, :ship_first_name_kana, :phone_number, :zip_code, :prefecture, :city, :address, :second_address ,presence: true
end
