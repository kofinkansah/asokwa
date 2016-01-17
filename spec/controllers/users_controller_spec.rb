require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "users#new action" do
		it "should successfully show the new user form" do
			get :new
			expect(response).to have_http_status(:success)
		end

	end

end
