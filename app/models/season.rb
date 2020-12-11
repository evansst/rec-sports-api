class Season < ApplicationRecord
  belongs_to :league
  has_many :standings
  has_many :teams, through: :standings
end
