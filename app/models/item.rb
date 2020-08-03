class Item < ApplicationRecord
  validates :images, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :description, presence: true
  validates :description, presence: true
  validates :description, presence: true
  validates :description, presence: true
  validates :price, presence: true
  
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
end
