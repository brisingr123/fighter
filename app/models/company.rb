class Company < ApplicationRecord
	has_and_belongs_to_many :categories, class_name: 'Category', join_table: 'categories_companies'
	has_and_belongs_to_many :products, class_name: 'Product', join_table: 'companies_products'
	has_and_belongs_to_many :investors, class_name: 'Investor', join_table: 'companies_investors'

	accepts_nested_attributes_for :categories
	accepts_nested_attributes_for :products

	belongs_to :city

	has_many :cofounders
end
