class CreateRateGraphComments < ActiveRecord::Migration[5.2]
  def change
    create_table :rate_graph_comments do |t|
      
      t.integer :user_id

      t.timestamps
    end
  end
end
