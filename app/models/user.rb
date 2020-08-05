class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128
  validates :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, presence: true
  has_one :destination, dependent: :destroy
  has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :selling_items, -> {where("buyer_id is NULL")}, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> {where("buyer_id is not NULL")}, foreign_key: "seller_id", class_name: "Item"
end
