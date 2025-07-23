class Doctor < ApplicationRecord
  validates :name, presence: true

  validates :active, inclusion: { in: [ true, false ] }, default: true
end
