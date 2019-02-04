class Category < ApplicationRecord
	has_and_belongs_to_many :companies

	has_many :products, through: :companies
end
