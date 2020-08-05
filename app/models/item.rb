class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :seller, class_name: "User"
  belongs_to :buyer,  class_name: "User"
end
