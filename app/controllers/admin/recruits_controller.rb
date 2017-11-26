class Admin::RecruitsController < ApplicationController
  before_action :set_recruit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @recruits = Recruit.order('created_at DESC').page(params[:page])
  end

  def show
  end

  def new
    @recruit = Recruit.new
    @recruit.recruit_images.build
    @company = Company.all
  end

  def edit
  end

  def create
    @recruit = Recruit.new(recruit_params)
    if @recruit.save
      redirect_to admin_recruits_path, notice: '求人が作成されました。'
    else
      render :new
    end
  end

  def update
    if @recruit.update(recruit_params)
      redirect_to [:admin, @recruit], notice: '求人が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @recruit.destroy
      redirect_to admin_recruit_path @company, notice: '求人が削除されました。'
    else

    end
  end

  private
    def set_recruit
      @recruit = Recruit.find(params[:id])
    end

    def recruit_params
      params.require(:recruit).permit(
          :occupation,
          :description,
          :job_summary,
          :job_description,
          :qualification,
          :employment_type,
          :salary,
          :welfare,
          :office_hours,
          :holiday,
          :location,
          :consideration,
          :information,
          :screening_process,
          :company_id,
          recruit_images_attributes: [:file_name]
      )
    end

  private
  def create_params
    params.require(:recruit).permit(recruit_images_attributes: [:image])
  end

end
