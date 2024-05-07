class RawMaterial < ApplicationRecord
  has_many :orders 

  validates :material_name, presence: true, uniqueness: true
  
end
