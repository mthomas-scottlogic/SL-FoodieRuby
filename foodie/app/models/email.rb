class Email < ApplicationRecord
  belongs_to :company

  validates :title, presence: true
  validates :body, presence: true
end
