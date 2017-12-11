class HomeController < ApplicationController
  layout 'user'

  def index
    @q = Recruit.search(params[:q])
    @company_count = Company.count
    @recruit_count = Recruit.count
    @recruits = @recruits = @q.result(distinct: true).page(params[:page]).per(15).order("updated_at DESC")
  end
end
