class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :artist, :description, :price, :picture, :title, presence: true
  # validates :description, presence: true

end
