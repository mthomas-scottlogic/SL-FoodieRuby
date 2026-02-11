class Company < ApplicationRecord
  has_many :menus
  has_many :emails
end
