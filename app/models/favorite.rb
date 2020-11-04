class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :book
	has_many :favorite_books, through: :favorites, source: 'book'
end
