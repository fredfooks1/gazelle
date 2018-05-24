class TasksController < ApplicationController

  def index
    @tasks = Task.all
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
        { name: task.company.name, address: task.first_location.address, final_price: task.cost_per_hour * task.task_time }
    end
  end


  def show
    @company = Company.find(params[:company_id])
    @task = Task.find(params[:id])
  end

  def edit
  end

  def new
    @company = Company.find(params[:company_id])
    @task = Task.new
  end

  def create
    @company = Company.find(params[:company_id])
    address = params.dig(:task, :first_location)
    company_location = @company.locations.find_by(address: address)
    company_location = Location.create(address: address) unless company_location

    @task = Task.new(task_params)
    @task.company = @company
    @task.first_location = company_location
    @company.user = current_user
    if @task.save
      redirect_to company_task_path(@company, @task)
    else
      render :new
    end
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
      .permit(:second_location, :gazelle_runner_id, :description, :company_id, :cost_per_hour, :task_time, :task_category_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
