class CreateItemimages < ActiveRecord::Migration[5.2]
  def change
    create_table :itemimages do |t|
      t.references :item, foreign_key: true
      t.string     :image, null: false
      t.timestamps
    end
  end
end
