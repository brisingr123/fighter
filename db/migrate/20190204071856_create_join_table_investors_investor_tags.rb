class CreateJoinTableInvestorsInvestorTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :investors, :investor_tags do |t|
      # t.index [:investor_id, :investor_tag_id]
      # t.index [:investor_tag_id, :investor_id]
    end
  end
end
