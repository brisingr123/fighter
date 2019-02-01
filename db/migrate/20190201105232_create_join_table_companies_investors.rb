class CreateJoinTableCompaniesInvestors < ActiveRecord::Migration[5.2]
  def change
    create_join_table :companies, :investors do |t|
      # t.index [:company_id, :investor_id]
      # t.index [:investor_id, :company_id]
    end
  end
end
