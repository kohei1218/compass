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

  def destroy
    @favorite = Favorite.find_by(user_id: favorite_params[:user_id], recruit_id: favorite_params[:recruit_id])
    respond_to do |format|
      if @favorite.destroy
        redirect_to recruits_path, notice: 'お気に入りを解除しました。'
      else
        redirect_to recruits_path, notice: @favorite.errors.full_messages
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
