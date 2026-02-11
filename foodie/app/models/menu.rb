class Menu < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :items

  validates :company, presence: true
end
