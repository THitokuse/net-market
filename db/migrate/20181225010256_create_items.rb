class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,  null: false
      t.integer     :price, null: false
      t.integer     :prefecture_code, null: false
      t.text        :content, null: false
      t.timestamps
    end
  end
end
