class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :company, null: false, foreign_key: true
      t.date :delivery_date
      t.date :deadline_date

      t.timestamps
    end
  end
end
