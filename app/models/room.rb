class Room < ApplicationRecord
  belongs_to :place
  validates :name, presence:true
  has_many :bookings
end
