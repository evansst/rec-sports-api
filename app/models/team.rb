class Team < ApplicationRecord
  has_many :plays_fors
  has_many :standings
  has_many :seasons, through: :standings
  has_many :leagues, through: :seasons
  has_many :players, through: :plays_fors
end
