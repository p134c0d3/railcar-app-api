class AddWeightToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :weight, :integer
  end
end
