class RemoveDeliveryFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :deliveryburden, null: false
    remove_reference :items, :deliverydate, null: false
#     remove_reference :items, :deliverymethod, null: false
  end
end
