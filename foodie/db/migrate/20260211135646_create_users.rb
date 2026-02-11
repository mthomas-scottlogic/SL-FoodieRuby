class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role
      t.string :email_address

      t.timestamps
    end
  end
end
