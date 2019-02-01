ActiveAdmin.register Company do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :founded_in, :website, :last_funding, :total_funding, :team_size, categories_ids: [], products_ids: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
# ActiveAdmin.register Post do
#   permit_params :name, :founded_in, :website, :last_funding, :total_funding, :team_size
# end
	action_item :New, only: :show do
  		link_to 'New Company', new_admin_company_path
	end
	form do |f|
		f.inputs do 
		 	f.input :name, required: true
			f.input :founded_in
			f.input :website
			f.input :last_funding
			f.input :total_funding
			f.input :team_size
			
		end
		f.inputs 'City' do 
			f.input :city_id , :as => :search_select , required: true
		end

		f.inputs 'Categories' do 
			f.input :categories , :as => :selected_list , :input_html => {:multiple => true}, :include_blank => false
		end
		f.inputs 'Products' do 
			f.input :products , :as => :selected_list , :input_html => {:multiple => true},:include_blank => false
		end



		f.actions
	end

	controller do 
		def create 
			@company = Company.create(company_params)
			puts @company.id 
			puts categories
			puts categories.length

			@company.categories << Category.find(categories)
			@company.products << Product.find(products)
			redirect_to resource_path(@company)
		end

		def update
			@company = Company.find_by_id(params[:id])

			previous_products = @company.products
			@company.products.delete(previous_products)

			previous_categories = @company.categories
			@company.categories.delete(previous_categories)
			@company.categories << Category.find(categories)
			@company.products << Product.find(products)
			@company.update(company_params)
			redirect_to resource_path
		end

		private 

		def company_params 
			params.require(:company).permit(:name, :founded_in, :website, :last_funding, :total_funding, :team_size,:city_id)
		end

		def categories 
			params[:company][:categories].reject { |e| e.to_s.empty? }
		end

		def products 
			params[:company][:products].reject { |e| e.to_s.empty? }
		end
	end
	
	show do 
		
		attributes_table do 
			row :name
			row :founded_in
			row :website
			row :last_funding
			row :total_funding
			row :team_size
			row :city
			list_row "Cofounders" do |c|
				c.cofounders.map{|e| e.name}
			end
		end
		panel "Categories" do 
			table_for company.categories do 
				column :name
			end
		end
		panel "Products" do 
			table_for company.products do 
				column :name
			end
		end

	end

	index do 
		selectable_column
		column "Id" do |c|
			link_to c.id, admin_company_path(c)
		end
		column :name
		column :founded_in
		column "Website" do |c|
			c.website
		end
		list_column "Cofounders", list_type: :ul do |c|
			c.cofounders.map { |e| e.name }
		end
		number_column :last_funding, as: :human
		number_column :total_funding, as: :human
		column :team_size
		list_column "Investors" do |c|

			c.investors.length > 0 ? (c.investors.map { |e| e.name }) : [(link_to "Add Investor", admin_investors_path)]
		end
		list_column "Categories" do |c|
			c.categories.map { |e| e.name }
		end
		list_column "Products" do |c|
			c.products.map { |e| e.name }
		end
		actions

	end

end
