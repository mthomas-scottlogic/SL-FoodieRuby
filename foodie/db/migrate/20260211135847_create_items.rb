class CreateItems < ActiveRecord::Migration[8.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.decimal :price_amount, precision: 10, scale: 2
      t.string :price_currency, default: 'USD'
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
