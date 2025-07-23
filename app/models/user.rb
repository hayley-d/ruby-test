class User < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_one :bank_account, dependent: :destroy

  validates :name, presence: true
  validates :last_name, presence: true
  validates :mobile, presence: true, uniqueness: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :email, presence: true, uniqueness: true
end
