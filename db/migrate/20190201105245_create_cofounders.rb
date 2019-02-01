class CreateCofounders < ActiveRecord::Migration[5.2]
  def change
    create_table :cofounders do |t|
    	t.string :name
    	t.string :linkedin
    	t.belongs_to :company 
      t.timestamps
    end
  end
end
