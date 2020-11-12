class ProjectsController < ApplicationController
  before_action :find_project, only: [:destroy, :update, :edit, :show]

  def index
    @projects = Project.all # TODO: ADD USER SCOPE
    # @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.js
      else
        format.js { render status: 422}
      end
    end
  end

  def show
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.js
      else
        format.js { render status: 422}
      end
    end
  end

  def destroy
    @project_id = @project.id
    @project.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end
end
