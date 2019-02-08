class AddItemToDeliveryContents < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :deliveryburden, null: false
    add_reference :items, :deliverydate, null: false
  end
end
