class FixturesController < ApplicationController
	def index
		@fixtures = Fixture.all
	end

	def new
		@fixture = Fixture.new
	end

	def create
		Fixture.create(fixture_params)
		redirect_to fixtures_path
	end

	private

	def fixture_params
		params.require(:fixture).permit(:league, :home_team, :away_team, 
										:home_score, :away_score, :match_time)
	end

end
