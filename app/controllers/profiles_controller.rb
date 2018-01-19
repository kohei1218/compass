class ProfilesController < ApplicationController
  before_action :set_user
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

  def edit_profile_resume
  end

  def edit_handicapped_resume
  end

  def edit_skill_resume
  end

  def edit_require_resume
  end

  def update_profile_resume
    if @user.update(profile_resume_params)
      redirect_to show_resume_profile_path, notice: 'プロフィール履歴書を更新しました'
    else
      render :edit_profile_resume
    end
  end

  def update_handicapped_resume
    if @user.update(handicapped_resume_params)
      redirect_to show_resume_profile_path, notice: '障がい履歴書を更新しました'
    else
      render :edit_handicapped_resume
    end
  end

  def update_skill_resume
    if @user.update(skill_resume_params)
      redirect_to show_resume_profile_path, notice: 'スキル履歴書を更新しました'
    else
      render :edit_skill_resume
    end
  end

  def update_require_resume
    if @user.update(require_resume_params)
      redirect_to show_resume_profile_path, notice: '希望履歴書を更新しました'
    else
      render :edit_require_resume
    end
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

  def profile_resume_params
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
        :prefecture,
        :address,
        :station,
        :final_education,
        :school_name,
        :graduate_date
    )
  end

  def handicapped_resume_params
    params.require(:user).permit(
        :first_handicapped_part,
        :first_handicapped_level,
        :second_handicapped_part,
        :second_handicapped_level,
        :wheelchair,
        :car_commute,
        :phone_support,
        :commute_time,
        :overtime,
        :available_overtime_hour,
        :available_ambulatory_count,
        :available_dialysis_count,
        :special_equipment
    )
  end

  def skill_resume_params
    params.require(:user).permit(
        :skill,
        :personal_summary
    )
  end

  def require_resume_params
    params.require(:user).permit(
        :require_first_occupation,
        :require_second_occupation,
        :require_location,
        :require_employment_type,
        :require_low_income,
        :require_high_income
    )
  end

  private
  def set_user
    @user = current_user
  end
end
