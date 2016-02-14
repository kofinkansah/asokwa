class Article < ActiveRecord::Base
	validates :title, presence: true
	validates :league, presence: true
	validates :body, presence: true
end
