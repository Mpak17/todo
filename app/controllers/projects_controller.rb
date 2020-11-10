class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @task = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save

    respond_to do |format|
      format.js { @project }
      format.html {  }
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end

  def edit
    @project = Project.all
    respond_to do |format|
      format.js {@project}
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
