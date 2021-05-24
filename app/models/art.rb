class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates_presence_of :artist, :description
end
