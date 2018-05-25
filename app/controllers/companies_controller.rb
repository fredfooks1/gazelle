class CompaniesController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show, :index]
    before_action :set_company, only: [ :edit, :update, :destroy]

  def index
    @companies = Company.all
    if params[:search]
      @companies = Company.search(params[:search]).order("created_at DESC")
    else
      @companies = Company.all.order("created_at DESC")
    end
  end

  def new
    @company = Company.new
  end

  def show
    @company = current_user.company
  end


  def edit
  end

  def update
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  def destroy
    @company.destroy
    redirect_to company_path
  end

  private

  def company_params
    params.require(:company).require(:user_id).permit(:name)
  end


    def set_company
      @company = Company.find(params[:id])
    end
  end
