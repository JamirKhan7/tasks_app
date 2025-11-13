class TasksController < ApplicationController
  def index
    @tasks = TaskQuery.new.filter.recent.includes(:user)
  end

  def show
    @task = Task.find(id: params[:id])
  end

  def create
    @task = TaskCreator.new(user: current_user, params: task_params).call
    if @task&.persisted?
      redirect_to @task, notice: "Task created a successfully."
    else
      @task ||= Task.new(task_params)
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @task = Task.new
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status)
  end

  def current_user
    User.first
  end
end
