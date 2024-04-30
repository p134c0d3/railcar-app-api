class Order < ApplicationRecord
  belongs_to :raw_material
  
  # associations
  has_one :raw_material

  # validations
  validates :car_number, :requested_date, :received_date, :extraction_start_date, :emptied_date, :released_date, presence: true

end
