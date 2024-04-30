class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :car_number
      t.date :requested_date
      t.date :received_date
      t.date :extraction_start_date
      t.date :emptied_date
      t.date :released_date
      t.references :raw_material, null: false, foreign_key: true

      t.timestamps
    end
  end
end
