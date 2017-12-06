class Admin::JobApplicationsController < ApplicationController
  before_action :set_job_applications, only: [:show]
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @job_applications = JobApplication.all.page(params[:page]).per(20).order("updated_at DESC")
  end

  def show
  end

  def new
  end

  def create
  end

  private
  def set_job_applications
    @job_application = JobApplication.find(params[:id])
  end

end
