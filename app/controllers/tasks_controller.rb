class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def edit
  end

  def new
    @task = Task.new
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
