class Fixture < ActiveRecord::Base

	validates :league, presence: true
	validates :home_team, presence: true
	validates :away_team, presence: true
	validates :home_score, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
	validates :away_score, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
end
