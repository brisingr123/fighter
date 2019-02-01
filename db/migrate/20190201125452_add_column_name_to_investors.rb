class AddColumnNameToInvestors < ActiveRecord::Migration[5.2]
  def change
  	add_column :investors, :name, :string
  end
end
