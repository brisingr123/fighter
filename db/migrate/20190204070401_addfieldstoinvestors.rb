class Addfieldstoinvestors < ActiveRecord::Migration[5.2]
  def change
  	add_column :investors, :website, :string
  	add_column :investors, :phone, :string
  	add_column :investors, :location, :string
  	add_column :investors, :city_id, :integer

  end
end
