class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :email, presence: true

  has_many :movies
  has_many :ratings
end
