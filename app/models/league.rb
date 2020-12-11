class League < ApplicationRecord
  has_many :seasons
  has_many :standings, through: :seasons
  has_many :teams, through: :standings
end
