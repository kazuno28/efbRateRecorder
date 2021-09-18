class CreateRateGraphs < ActiveRecord::Migration[5.2]
  def change
    create_table :rate_graphs do |t|
      
      t.integer :user_id
      t.string :before_rate
      t.string :after_rate

      t.timestamps
    end
  end
end
