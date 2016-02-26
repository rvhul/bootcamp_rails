# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  status      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TasksController < ApplicationController

  def index
    @not_started_tasks = return_current_user.tasks.where(status: Task::StatusTask::NOT_STARTED)
    @started_tasks = return_current_user.tasks.where(status: Task::StatusTask::STARTED)
    @finished_tasks = return_current_user.tasks.where(status: Task::StatusTask::COMPLETED)
  end

  def new
    @task = Task.new
  end

  def create
    current_user = return_current_user
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:success] = "Successfully added task."
      redirect_to tasks_path
    else
      flash.now[:error] = "You didn't inlcude a title, please do."
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attribute(:status, params[:status].to_i)
  end

  private
  def task_params
    params.require(:task).permit(:title, :description)
  end
end
