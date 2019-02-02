ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    panel "Top Categories By Companies" do
        render 'shared/barchart', :collection => Category.joins(:categories_companies).group(:name).count(:company_id)
    end

    panel "Top Categories By Investment" do
        render 'shared/barchart', :collection => Category.joins(:companies).group(:name).sum(:total_funding)
    end    

    # panel "Top Categories By Number of Investors" do

    #     render 'shared/barchart', :collection => Category.joins(:categories_companies).joins(:companies).joins(:companies_investors).joins(:investors).group(:name).count(:name)
    # end

    panel "Top Cities By Categories" do
        @city_hash = Category.joins(:companies).group(:city_id).count(:name)
        @city_hash_name = {}
        @city_hash.each do |k,v| 
            city = City.find_by_id(k)
            !city.nil? ? @city_hash_name[city.name] = v : next 
        end
        puts @city_hash_name
        render 'shared/barchart', :collection => @city_hash_name
    end

    panel "Top Products By Companies" do

        render 'shared/barchart', :collection => Product.joins(:companies).group(:name).count(:id)
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
