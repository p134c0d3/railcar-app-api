class RemoveWeightFromRawMaterials < ActiveRecord::Migration[7.1]
  def change
    remove_column :raw_materials, :weight, :integer
  end
end
