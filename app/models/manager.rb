class Manager < ApplicationRecord
  has_many :places
  has_many :rooms, through: :places
  validates :name, presence:true, uniqueness: true
end
