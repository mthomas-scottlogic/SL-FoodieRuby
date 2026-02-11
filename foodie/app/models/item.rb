class Item < ApplicationRecord
  has_and_belongs_to_many :orders
  has_and_belongs_to_many :menus

  validates :name, presence: true
end
