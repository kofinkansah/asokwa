require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "accessing GET /login" do
    it "should take you to the user login page" do
      get login_path
      expect(response).to have_http_status(200)
    end
  end

  describe "login with invalid information" do
  	it "should not work, should reshow user form with non-persistent flash message" do
  		get login_path
  		expect(response).to render_template('sessions/new')
  		post login_path, session: { email: " ", password: " " }
  		expect(response).to render_template('sessions/new')
  		expect(flash[:danger]).to_not be(nil)
  		get root_path
  		expect(flash[:danger]).to be(nil)
  	end
  end
  
end
