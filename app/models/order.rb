class Order < ApplicationRecord
  belongs_to :raw_material
  
  # associations
  # has_one :raw_material

  # validations
  validates :car_number, presence: true
  validates :requested_date, presence: true

end
