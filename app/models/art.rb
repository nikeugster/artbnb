class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :artist, :description, :price, :picture, :title, presence: true
  # validates :description, presence: true

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
