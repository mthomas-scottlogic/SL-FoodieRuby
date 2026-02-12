class Menu < ApplicationRecord
  belongs_to :company
  has_many :items

  # Dates for menu delivery and deadline
  attribute :delivery_date, :date
  attribute :deadline_date, :date
end
