class TasksController < ApplicationController
  def index
    @tasks = Task.where(state: "pending").reject { |task| task.first_location.nil? }
    # @tasks = Task.where.not(first_location: nil, second_location: nil)

    @markers = @tasks.map do |task|
      {
        lat: task.first_location.latitude,
        lng: task.first_location.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

    @addresses_for_tasks = {}
    @tasks.each do |task|
      @addresses_for_tasks["#{task.first_location.latitude},#{task.first_location.longitude}"] =
        { name: task.company.name, address: task.first_location.address, final_price: task.cost_per_hour * task.task_time, title: task.title }
    end
  end

  def show
    @company = current_user.company
    @task = Task.find(params[:id])

    if  @task.gazelle_runner && @task.second_location
      @markers = [c_marker, g_marker, p_marker]
      @end_points = {origin: @task.gazelle_runner.address, destination: @task.first_location.address, waypoint: @task.second_location.address}
    elsif @task.second_location.address
      @markers = [c_marker, p_marker]
      @end_points = { destination: @task.first_location.address, waypoint: @task.second_location.address}
    elsif @task.gazelle_runner
      @markers = [c_marker, g_marker]
      @end_points = {origin: @task.gazelle_runner.address, destination: @task.first_location.address}
    else
      @markers = [c_marker]
    end


  end

  def c_marker
    # this is the marker of the company
  @location = @task.first_location
    {
          lat: @location.latitude,
          lng: @location.longitude,
          icon: ActionController::Base.helpers.asset_path("building.png")
        }
  end

  def g_marker
    # this is the marker of the gazelle
    @gazelle_runner = @task.gazelle_runner
      gazelle_marker = {
        lat: @gazelle_runner.latitude,
        lng: @gazelle_runner.longitude,
        icon: ActionController::Base.helpers.asset_path("red-gazelle-icon.png")
       }
  end

  def p_marker
    # this is the marker of the pick up location
       @pick_location = @task.second_location
      pick_marker = {
        lat: @pick_location.latitude,
        lng: @pick_location.longitude,
        # icon: ActionController::Base.helpers.asset_path("tree_icon.png")
      }
  end

  def edit
  end

  def new
    @search_term = params[:search]
    @company = Company.find(params[:company_id])
    @company_marker =  {
        lat: @company.latitude,
        lng: @company.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }

    @task = Task.new

    @gazelle_runners = GazelleRunner.where.not(latitude: nil, longitude: nil)
    @markers = @gazelle_runners.map do |gazelle_runner|
      {
        lat: gazelle_runner.latitude,
        lng: gazelle_runner.longitude
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }

    end

    @names_for_gazelles = {}
    @gazelle_runners.each do |gazelle_runner|
       @names_for_gazelles["#{gazelle_runner.latitude},#{gazelle_runner.longitude}"] =
       { first_name: gazelle_runner.first_name, last_name: gazelle_runner.last_name}
    end

  end

  def accept_task
    @task = Task.find(params[:task])
    @task.gazelle_runner = current_user.gazelle_runner
    @task.state = "assigned"
    @task.save
    redirect_to task_path(@task)
  end

  def create
    @company = Company.find(params[:company_id])
    address = params.dig(:task, :first_location)

    company_location = @company.locations.find_by(address: address)
    company_location = Location.create(address: address, company: @company) unless company_location


    second_address = params.dig(:task, :second_location)
    second_location = Location.create(address: second_address)

    @task = Task.new(task_params)
    @task.company = @company
    @task.first_location = company_location
    @task.second_location = second_location

    @task.state = "pending"
    @company.user = current_user
    if @task.save
      redirect_to company_task_path(@company, @task)

    else
      render :new
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.state = "completed"
    @task.save
    redirect_to task_path(@task)
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to task_path
  end

  private

  def task_params
    params
      .require(:task)
      .permit( :gazelle_runner_id, :description, :company_id, :cost_per_hour, :task_time, :title, :state)

  end

  def set_task
    @task = Task.find(params[:id])
  end
end
