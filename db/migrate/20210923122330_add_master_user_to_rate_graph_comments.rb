class AddMasterUserToRateGraphComments < ActiveRecord::Migration[5.2]
  def change
    add_column :rate_graph_comments, :master_user, :integer
  end
end
