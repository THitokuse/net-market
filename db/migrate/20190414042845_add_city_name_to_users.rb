class AddCityNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city_name, :string
  end
end
