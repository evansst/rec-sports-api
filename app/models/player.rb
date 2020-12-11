class Player < ApplicationRecord
  has_secure_password
  
  has_many :plays_fors
  has_many :teams, through: :plays_fors
end
