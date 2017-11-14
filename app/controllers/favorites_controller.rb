class FavoritesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to recruits_path, notice: 'お気に入りに追加しました' }
      else
        format.html { redirect_to  recruits_path, notice:  @favorite.errors.full_messages }
      end
    end
  end

  def favorite_params
    params.permit(
        :user_id,
        :recruit_id
    )
  end
end
