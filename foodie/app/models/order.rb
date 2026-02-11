class Order < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_and_belongs_to_many :items

  validates :delivery_date, presence: true
  validates :deadline_date, presence: true
end
