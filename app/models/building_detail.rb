class BuildingDetail < ApplicationRecord
  belongs_to :building, optional: true
end
