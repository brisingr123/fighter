ActiveAdmin.register Investor do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, company_ids: [], investor_tag_ids: []
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
		 	f.input :website
		 	f.input :phone
		 	f.input :investor_tag_ids, as: :tags, collection: InvestorTag.all, display_name: :name, :include_blank => false, label: "Tags"

			
		end

		f.inputs 'City' do 
			f.input :city_id , :as => :search_select 
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
			@investor.investor_tags << investor_tags
			redirect_to resource_path(@investor)
		end

		def update
			@investor = Investor.find_by_id(params[:id])
			previous_companies = @investor.companies
			@investor.companies.delete(previous_companies)

			@investor.companies << Company.find(companies)
			

			previous_tags = @investor.investor_tags
			@investor.investor_tags.delete(previous_tags)

			@investor.investor_tags << investor_tags

			@investor.update(investor_params)
			redirect_to resource_path
		end

		private 

		def investor_params 
			params.require(:investor).permit(:name, :city_id, :website, :phone)
		end

		def companies 
			params[:investor][:companies].reject { |e| e.to_s.empty? }
		end

		def investor_tags
			tag_ids = params[:investor][:investor_tag_ids]
			tags = []
			tag_ids.each do |tag|
				tag = InvestorTag.find_by_id(tag)
				tag ? (tags << tag ) : nil 
			end
			tags 
		end
	end

	show do 
		attributes_table do 
			row :name
			row :city
			row :website
			row :phone
			list_row "Type" do |c|
				c.investor_tags.map{|e| e.name}
			end
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

		list_column "Type", list_type: :ul do |c|
			c.investor_tags.map { |e| e.name }
		end

		column :city
	end

end
