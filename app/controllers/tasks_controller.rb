class TasksController < ApplicationController
def new
    @task = Task.new
  end

  def create
    task_params  = params.require(:task).permit([:title, :body])
    @task       = Task.new task_params

    if @task.save
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def show
    @task = Task.find params[:id]
  end

  def index
    @tasks = Task.order(created_at: :desc)
  end

  def destroy
    task = Task.find params[:id]
    task.destroy
    redirect_to tasks_path
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    if @task.update task_params
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  private
  def task_params
  params.require(:task).permit(:title, :body)
  end

end
