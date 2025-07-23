class User < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :addresses, dependent: :destroy
end
