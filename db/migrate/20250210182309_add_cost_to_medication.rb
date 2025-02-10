class AddCostToMedication < ActiveRecord::Migration[8.0]
  def change
    add_column :medications, :unit_price, :float
  end
end
