class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string  :credit_number, null: false
      t.string :limit_month, null: false
      t.string :limit_year, null: false
      t.string :security_code, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
