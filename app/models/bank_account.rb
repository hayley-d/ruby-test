class BankAccount < ApplicationRecord
  belongs_to :user
  belongs_to :bank

  validates :account_number, presence: true, uniqueness: true
end
