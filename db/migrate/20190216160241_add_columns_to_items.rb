class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :size, null: false
    add_reference :items, :upper_category, null: false
    add_reference :items, :middle_category, null: false
    add_reference :items, :lower_category, null: false
    add_reference :items, :brand, null: false
    add_reference :items, :delivery_burden, null: false
    add_reference :items, :delivery_date, null: false
    add_reference :items, :delivery_method, null: false
    add_reference :items, :user, null: false
  end
end
