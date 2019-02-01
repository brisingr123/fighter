ActiveAdmin.register Cofounder do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :company_id, :linkedin
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	action_item :New, only: :show do
  		link_to 'New Co-founder', new_admin_cofounder_path
	end
end
