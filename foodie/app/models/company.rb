class Company < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :emails, dependent: :destroy

  validates :name, presence: true
end
