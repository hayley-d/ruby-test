class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :active, inclusion: { in: [ true, false ] }
end
