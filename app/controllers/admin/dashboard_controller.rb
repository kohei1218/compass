class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @company_count = Company.count
    @recruit_count = Recruit.count
  end
end
