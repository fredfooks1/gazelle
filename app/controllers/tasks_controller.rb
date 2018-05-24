class TasksController < ApplicationController
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
    company = Company.find(params[:company_id])
    task = Task.new(task_params)
    task.company = company
    task.user = current_user

    if task.save
      redirect_to task_path(task)
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
    params.require(:task).permit(:name)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
