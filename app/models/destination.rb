class Destination < ApplicationRecord
  belongs_to :user, optional: true
  validates :ship_last_name, :ship_first_name, :ship_last_name_kana, :ship_first_name_kana, :phone_number, :zip_code, :prefecture, :address, :second_address ,presence: true
end
