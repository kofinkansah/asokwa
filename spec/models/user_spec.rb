require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Entry" do	
  	it "should be valid" do #test1
  		user = User.new(name: "Johnson", email: 'user@example.com', 
                      password: "foobar", password_confirmation: "foobar")
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

  	it "should accept valid email addresses" do #test6
  		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
  													first.last@foo.jp alice+bob@baz.cn]
  		valid_addresses.each do |valid_address|
  		user = User.new(name: "Zayka", email: valid_address, password: "foobar",
                      password_confirmation: "foobar" )
  		expect(user).to be_valid, "#{valid_address.inspect} should be valid"
  		end #for valid addresses block
  	end

  	it "should reject invalid email address" do #test7
  		invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
  													foo@bar_baz.com foo@bar+baz.com]
  		invalid_addresses.each do |invalid_address|
  		user = User.new(name: "Xuru", email: invalid_address)
  		expect(user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
  		end #for invalid addresses block											
  	end #for test7
	 
    it "should only accept unique emails" do #test8
      user = User.new(name: "Johnson", email: 'tester@example.com')
      duplicate_user = user.dup
      duplicate_user.email = user.email.upcase
      user.save
      expect(duplicate_user).not_to be_valid
    end

    it "should save email as lowercase" do
      user = User.new(name: "Jeremiah", email: 'TeSTer@EXample.COM',
                      password: "foobar", password_confirmation: "foobar")
      mixed_case_email = user.email
      user.save
      expect(user.reload.email).to eq(mixed_case_email.downcase)
    end

    it "should have a present password" do #test 9
      user = User.new(password: "foobar", password_confirmation: "foobar")
      user.password = user.password_confirmation = " " * 6
      expect(user).not_to be_valid
    end

    it "should have a password of a minimum 6 characters" do #test 10
      user = User.new(password: "foobar", password_confirmation: "foobar")
      user.password = user.password_confirmation = "a" * 5
      expect(user).not_to be_valid
    end

	end #for describe "User Entry" line


end
