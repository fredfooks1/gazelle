class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    if params[:search]
      @companies = Company.search(params[:search]).order("created_at DESC")
    else
      @companies = Company.all.order("created_at DESC")
    end
  end

  def show
    @company = Company.find(params[:id])
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
    params.require(:company).permit(:name)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
