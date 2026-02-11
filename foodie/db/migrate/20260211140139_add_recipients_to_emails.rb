class AddRecipientsToEmails < ActiveRecord::Migration[8.1]
  def change
    add_column :emails, :recipients, :text
  end
end
