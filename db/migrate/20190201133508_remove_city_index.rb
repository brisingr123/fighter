class RemoveCityIndex < ActiveRecord::Migration[5.2]
  def change
  	remove_index :companies, column: :city_id
  end
end
