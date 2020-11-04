class FavoritesController < ApplicationController

 def index 
    @favorite_books = current_user.favorite_books
 end

def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.book_id = params[:book_id]

    if favorite.save
      redirect_to request.referer
    else
      redirect_to request.referer, danger: 'お気に入り登録に失敗しました'
    end
end


def destroy
	 favorite = Favorite.find_by(user_id: current_user.id, book_id: params[:book_id])
   
    favorite.destroy if favorite.present?
if favorite.destroyed?
      redirect_to request.referer
    else
      redirect_to request.referer, danger: 'お気に入り解除に失敗しました'
    end
  end

end