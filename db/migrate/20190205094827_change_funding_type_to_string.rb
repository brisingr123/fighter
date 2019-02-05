class ChangeFundingTypeToString < ActiveRecord::Migration[5.2]
  def change
  	change_column :companies, :total_funding, :string
  end
end
