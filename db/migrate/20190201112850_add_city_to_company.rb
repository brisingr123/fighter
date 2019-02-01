class AddCityToCompany < ActiveRecord::Migration[5.2]
  def change
  	add_reference :companies, :city , index: true
  end
end
