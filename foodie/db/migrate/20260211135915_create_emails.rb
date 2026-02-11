class CreateEmails < ActiveRecord::Migration[8.1]
  def change
    create_table :emails do |t|
      t.string :title
      t.text :body
      t.references :company, null: false, foreign_key: true
      t.string :menu_link

      t.timestamps
    end
  end
end
