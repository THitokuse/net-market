class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :item, null: false, index: true, foreign_key: true
      t.references :trading_partner, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
