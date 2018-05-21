class GazelleRunnerController < ApplicationController
  def index
    @gazelles = Gazelle.all
  end

  def show
    @gazelle = Gazelle.find(params[:id])
  end

  def edit
  end

  def update
    @gazelle.update(gazelle_params)
    redirect_to gazelle_path(@gazelle)
  end

  def destroy
    @gazelle.destroy
    redirect_to _path
  end

  private

  def gazelle_params
    params.require(:gazelle).permit(:name)
  end

  def set_gazelle
    @gazelle = Gazelle.find(params[:id])
  end

end
