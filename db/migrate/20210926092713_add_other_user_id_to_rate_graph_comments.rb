class AddOtherUserIdToRateGraphComments < ActiveRecord::Migration[5.2]
  def change
    add_column :rate_graph_comments, :other_user_id, :integer
  end
end
