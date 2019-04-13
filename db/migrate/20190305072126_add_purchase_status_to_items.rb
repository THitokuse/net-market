class AddPurchaseStatusToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :purchase_status, :integer
  end
end
