class AddConditionIdtoItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :condition, null: false
  end
end
