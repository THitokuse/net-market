class RemoveCityCodeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :city_code, :string
  end
end
