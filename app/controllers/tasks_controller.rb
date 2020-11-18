class TasksController < ApplicationController
  before_action :find_task, only: [:destroy, :show, :edit, :update, :move]

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.js
      else
        format.js { render status: 422}
      end
    end
  end

  def show; end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js
      else
        format.js { render status: 422 }
      end
    end
  end

  def destroy
    @task_id = @task.id
    @task.destroy

    respond_to do |format|
      format.js
    end
  end

  def move
    @task.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :project_id, :active, :deadline)
      # .tap do |whitelisted|

      # whitelisted[:active] = ActiveModel::Type::Boolean.new.cast(params.dig(:task, :active)) if
      #     params.dig(:task, :active) != nil
  end
end
