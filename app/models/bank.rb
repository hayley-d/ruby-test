class Bank < ApplicationRecord
  has_many :bank_accounts, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
