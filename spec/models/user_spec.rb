require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Entry" do	
  	it "should be valid" do #test1
  		user = User.new(name: "Johnson", email: 'tester@example.com')
  		expect(user).to be_valid
  	end

  	it "should have a name present" do #test2
  		user = User.new(name: nil, email: 'opportunity@example.com')
  		user.valid?
  		expect(user).not_to be_valid
  	end

  	it "should have an email present" do #test3
  		user = User.new(name: "Oboo Emma", email: nil)
  		user.valid?
  		expect(user).not_to be_valid
  	end

  	it "should not have a name over 50 characters" do #test4
  		user = User.new(name: "a" * 51, email: 'tester@example.com')
  		user.valid?
  		expect(user).not_to be_valid
  	end

  	it "should not have an email over 255 characters" do #test5
  		user = User.new(name: "Zorro", email: 'a' * 244 +'@example.com')
  		user.valid?
  		expect(user).not_to be_valid
  	end


	end #for describe "User Entry" line




end
