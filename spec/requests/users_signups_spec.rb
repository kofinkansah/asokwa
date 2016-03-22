require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "accessing GET /signup" do
    it "should take you to new signup page" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end

  describe "signing up with invalid information" do
    it "should not work and should go back to the signup form" do
      get signup_path
      expect do
        post users_path, user: {
          name:                   "",
          email:                  "user@invalid",
          password:               "foo",
          password_confirmation:  "bar"
        }
      end.to_not change{ User.count }
      expect(response).to render_template('new')  
      expect(response.body).to include('errors')
    end
  end

  describe "signing up with valid information" do
    it "should work and should redirect to the user's show view" do
      get signup_path
      expect do
        post_via_redirect users_path, user: {
          name:                  "Charles Bronson",
          email:                 "charles@bronson.com",
          password:              "foobar",
          password_confirmation: "foobar"
        }
      end.to change { User.count }.from(0).to(1)
      expect(response).to render_template('show')
      expect(flash[:success]).to_not be(nil)
    end
  end


end # for Rpec.describe
