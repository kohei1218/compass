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
        format.html { redirect_to @favorite, notice: 'Recruit was successfully created.' }
      else
        format.html { redirect_to  recruits_path }
      end
    end
  end

  def favorite_params
    params.fetch(:favorite, {})
  end
end
