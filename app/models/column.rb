class Column < ApplicationRecord
  belongs_to :battery, optional: true
  has_many :elevators
end
