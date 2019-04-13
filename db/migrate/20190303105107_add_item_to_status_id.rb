class AddItemToStatusId < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :status, null: false
  end
end
