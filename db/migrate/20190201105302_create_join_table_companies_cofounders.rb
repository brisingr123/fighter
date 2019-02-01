class CreateJoinTableCompaniesCofounders < ActiveRecord::Migration[5.2]
  def change
    create_join_table :companies, :cofounders do |t|
      # t.index [:company_id, :cofounder_id]
      # t.index [:cofounder_id, :company_id]
    end
  end
end
