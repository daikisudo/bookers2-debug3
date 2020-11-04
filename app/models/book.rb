class Book < ApplicationRecord
	
	validates :title, presence: true
	validates :body, presence: true
	
 	belongs_to :user, optional: true
 	has_many :favorites
 	has_many :favorite_users, through: :favorites, source: 'user'
    has_many :book_comments
end