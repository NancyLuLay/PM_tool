class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    project_params  = params.require(:project).permit([:title, :body])
    @project       = Project.new project_params
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find params[:id]
    @discussion = Discussion.new
  end

  def index
    @projects = Project.order(created_at: :desc)
  end

  def destroy
    project = Project.find params[:id]
    project.destroy
    redirect_to projects_path
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    if @project.update project_params
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private
  def project_params
    params.require(:project).permit(:title, :body)
  end

end
