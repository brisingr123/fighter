class CreateInvestorTags < ActiveRecord::Migration[5.2]
  def change
    create_table :investor_tags do |t|
      t.string :name, index: true 
      t.timestamps
    end
  end
end
