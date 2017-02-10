class Player < ApplicationRecord
  belongs_to :user
  has_many :team_players
  has_many :teams, through: :team_players
  has_many :games, through: :teams
end
