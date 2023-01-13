class Guest < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :email, uniqueness: true
end
