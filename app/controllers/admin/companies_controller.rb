class Admin::CompaniesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @companies = Company.order('created_at DESC').page(params[:page]).per(20)
  end

  def show
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to admin_companies_path, notice: '会社が作成されました'
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(
        :admin,
        :description,
        :name,
        :establishment_date,
        :representative,
        :employees,
        :capital,
        :business,
        :url
    )
  end

end
