class RemoveMasterNameFromRateGraphComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :rate_graph_comments, :master_name, :integer
  end
end
