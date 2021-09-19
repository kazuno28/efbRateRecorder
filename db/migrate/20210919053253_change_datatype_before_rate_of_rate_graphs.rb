class ChangeDatatypeBeforeRateOfRateGraphs < ActiveRecord::Migration[5.2]
  def change
    change_column :rate_graphs, :before_rate, :integer
  end
end
