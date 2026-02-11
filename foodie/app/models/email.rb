class Email < ApplicationRecord
  belongs_to :company
  serialize :recipients, coder: JSON
end
