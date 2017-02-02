class Place < ApplicationRecord
  belongs_to :manager
  has_many :rooms
  validates :name, presence:true
end
