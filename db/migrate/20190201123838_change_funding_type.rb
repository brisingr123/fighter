class ChangeFundingType < ActiveRecord::Migration[5.2]
  def change
  	change_column :companies, :last_funding, :string
  end
end
