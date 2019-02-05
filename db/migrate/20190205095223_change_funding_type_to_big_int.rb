class ChangeFundingTypeToBigInt < ActiveRecord::Migration[5.2]
  def change
  	change_column :companies, :total_funding, :bigint, using: 'total_funding::integer'
  end
end
