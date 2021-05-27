class Art < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :artist, :description, :price, :picture, :title, presence: true
  # validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_artist,
    against: [:title, :artist],
    using: {
      tsearch: { prefix: true }
    }

  def self.search(query)
    Art.search_by_title_and_artist(query)
  end
end
