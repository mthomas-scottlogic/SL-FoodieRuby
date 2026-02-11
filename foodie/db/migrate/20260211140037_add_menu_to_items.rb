class AddMenuToItems < ActiveRecord::Migration[8.1]
  def change
    add_reference :items, :menu, null: false, foreign_key: true
  end
end
