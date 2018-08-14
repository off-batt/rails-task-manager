class TasksController < ApplicationController
  # create
  def new
    @task = Task.new
  end

  def create
    task_params = params.require(:task).permit(:title, :details)
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  # read
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # update
  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    task_params = params.require(:task).permit(:title, :details)
    @task.update(task_params)
    redirect_to tasks_path(@task)
  end
  # delete
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
end
