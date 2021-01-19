class Api::V1::TasksController < ApplicationController

  def index
    tasks = current_api_v1_user.tasks.order(:id)
    render json: tasks
  end

  def create
    tasks = Task.transaction do
      task_params[:_json].each do |task|
        current_api_v1_user.tasks.create!(name: task)
      end
    end

    render json: tasks, status: :created
  end

  def fetch_edit_task
    task = Task.find(params[:taskID])
    render json: task, status: :created
  end

  def update
    task = Task.find(task_params[:_json][0])
    if task.update(name: task_params[:_json][1])
      render json: task, status: :created
    end
  end

  def destroy_all
    Task.destroy_all
  end


end

private

def task_params
  params.permit(_json:[])
end
