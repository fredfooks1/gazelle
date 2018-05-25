class GazelleRunnersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_gazelle, only: [:show, :edit, :update, :destroy]

  def index
    @gazelle_runners = GazelleRunner.all
  end

  def show
    @gazelle_runner = GazelleRunner.find(params[:id])
  end

  def edit
  end

  def new
    @gazelle_runner = GazelleRunner.new
  end

  def create
    @gazelle_runner = GazelleRunner.new(gazelle_params)
    @gazelle_runner.user = current_user
    if @gazelle_runner.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update
    task = Task.find(gazelle_update_params)
    @gazelle_runner.tasks << task
    @gazelle_runner.save!
    redirect_to gazelle_runner_path(@gazelle_runner)
  end

  def destroy
    @gazelle_runner.destroy
    redirect_to gazelle_runners_path
  end

  private

  def gazelle_update_params
    params.require(:task)
  end

  def gazelle_params
    params.require(:gazelle_runner).permit(:photo, :first_name, :last_name, :description)
  end

  def set_gazelle
    @gazelle_runner = GazelleRunner.find(params[:id])
  end
end
