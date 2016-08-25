class DiscussionsController < ApplicationController

  before_action :find_project
  before_action :find_discussion, except: [:create]

  def create
    @discussion = Discussion.new params.require(:discussion).permit(:name, :body)
    # @project = Project.find params[:project_id]
    @discussion.project = @project
      if @discussion.save
        redirect_to project_path(@project), notice: "Discussion created"
      else
        flash[:alert] = "Please fix errors below"
        render "/projects/show"
      end
  end

  def destroy
    # q = Project.find params[:project_id]
    # d = Discussion.find params[:id]
    d.destroy
    redirect_to project_path(q), notice: "Discussion deleted"
  end

  def edit
    # @project = Project.find params[:project_id]
    # d = Discussion.find params[:id]
  end

  def update
    #q = Project.find params[:project_id]
    # d = Discussion.find params[:id]
    #byebug
    discussion_params = params.require(:discussion).permit([:name, :body])
    if @discussion.update discussion_params
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private
  def find_project
    @project = Project.find params[:project_id]
  end

  def find_discussion
    @discussion = Discussion.find params[:id]
  end

end
