class CreateRawMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :raw_materials do |t|
      t.string :material_name

      t.timestamps
    end
  end
end
