class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
    	t.string :name
    	t.integer :founded_in
    	t.string :website
    	t.integer :last_funding
    	t.integer :total_funding
    	t.integer :team_size
      t.timestamps
    end
  end
end
