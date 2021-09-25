class RemoveMasterUserFromRateGraphComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :rate_graph_comments, :master_user, :integer
  end
end
