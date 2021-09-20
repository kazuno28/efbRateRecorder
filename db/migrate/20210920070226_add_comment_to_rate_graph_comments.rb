class AddCommentToRateGraphComments < ActiveRecord::Migration[5.2]
  def change
    add_column :rate_graph_comments, :comment, :text
  end
end
