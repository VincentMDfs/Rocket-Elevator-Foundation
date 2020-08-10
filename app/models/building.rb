class Building < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :address, optional: true
  has_many :building_details
  has_many :batteries
end
