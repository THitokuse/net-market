class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string :authorization_code, null: false, unique: true
      t.string :security_code, null: false
      t.string :month, null: false
      t.string :year, null: false
      t.references :user, null: false, index: true, foreign_key: true
      t.string :payjp_token
    end
  end
end
