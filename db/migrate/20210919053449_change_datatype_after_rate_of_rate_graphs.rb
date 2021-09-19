class ChangeDatatypeAfterRateOfRateGraphs < ActiveRecord::Migration[5.2]
  def change
    change_column :rate_graphs, :after_rate, :integer
  end
end
