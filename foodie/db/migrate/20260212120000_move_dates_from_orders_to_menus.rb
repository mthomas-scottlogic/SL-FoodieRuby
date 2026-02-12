class MoveDatesFromOrdersToMenus < ActiveRecord::Migration[8.1]
  def change
    remove_column :orders, :delivery_date, :date
    remove_column :orders, :deadline_date, :date
    add_column :menus, :delivery_date, :date
    add_column :menus, :deadline_date, :date
  end
end
