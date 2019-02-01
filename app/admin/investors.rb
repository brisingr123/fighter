ActiveAdmin.register Investor do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, company_ids: []
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	action_item :New, only: :show do
  		link_to 'New Investor', new_admin_investor_path
	end
	form do |f|
		f.inputs do 
		 	f.input :name, required: true

			
		end

		f.inputs 'Companies' do 
			f.input :companies , :as => :selected_list , :input_html => {:multiple => true}, :include_blank => false
		end

		f.actions
	end

	controller do 
		def create 
			@investor = Investor.create(investor_params)

			@investor.companies << Company.find(companies)
			
			redirect_to resource_path(@investor)
		end

		def update
			@investor = Investor.find_by_id(params[:id])
			previous_companies = @investor.companies
			@investor.companies.delete(previous_companies)

			@investor.companies << Company.find(companies)
			
			redirect_to resource_path
		end

		private 

		def investor_params 
			params.require(:investor).permit(:name)
		end

		def companies 
			params[:investor][:companies].reject { |e| e.to_s.empty? }
		end
	end

	show do 
		attributes_table do 
			row :name
			list_row "Companies" do |c|
				c.companies.map{|e| e.name}
			end
		end

		active_admin_comments
	end

	index do 
		selectable_column
		column "Id" do |c|
			link_to c.id, admin_investor_path(c)
		end
		column :name
		list_column "Companies", list_type: :ul do |c|
			c.companies.map { |e| link_to e.name, admin_company_path(e) }
		end
	end

end
