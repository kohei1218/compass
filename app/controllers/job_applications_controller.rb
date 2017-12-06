class JobApplicationsController < ApplicationController
  layout 'user'

  def index
    @recruits = []
    applications = JobApplication.where(user_id: current_user.id)
    applications.each do |application|
      @recruits << application.recruit
    end
  end

  def show
  end

  def new
  end

  def create
    @job_application = JobApplication.new(application_params)
    if@job_application.save
      redirect_to recruits_path, notice: '応募しました'
    else
      redirect_to  recruits_path, notice:  @job_application.errors.full_messages
    end
  end

  def application_params
    params.permit(
        :user_id,
        :recruit_id
    )
  end

end
