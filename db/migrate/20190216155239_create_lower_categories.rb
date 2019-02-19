class CreateLowerCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :lower_categories do |t|
      t.string      :name, null: false
      t.references  :middle_category, null: false
      t.timestamps
    end
  end
end
