class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  layout 'user'
  def show
  end

  def edit
  end

  def update
    if @user.update(profile_params)
      redirect_to profile_path, notice: 'ユーザー情報を更新しました'
    else
      render :edit
    end
  end

  def show_resume
  end

  def edit_resume
  end

  def update_resume
  end

  def profile_params
    params.require(:user).permit(
        :first_name,
        :last_name,
        :first_name_kana,
        :last_name_kana,
        :sex,
        :birthday,
        :phone_number,
        :cell_phone_number,
        :employed_status,
        :first_handicapped_part,
        :first_handicapped_level,
        :second_handicapped_part,
        :second_handicapped_level
    )
  end

  private
  def set_user
    @user = current_user
  end
end
