class Api::V1::TasksController < ApplicationController

  def index
    tasks = current_api_v1_user.tasks.order(:id)
    render json: tasks
  end

  def create
    errors = []
    tasks = []
    Task.transaction do
      if task_params[:_json].all?{ |value| value === "" }
        errors << "タスクが入力されていません。"
      end

      tasks = task_params[:_json].each do |task|
        if task.length <= 40
          current_api_v1_user.tasks.create!(name: task)
        else
          errors << "40文字以下で入力してください。"
          raise ActiveRecord::Rollback        
        end        
      end

      if errors.present?
        raise ActiveRecord::Rollback       
      end      
    end

      if errors.present?
        render json: { errors: errors }, status: :created       
      else
        render json: tasks, status: :created
      end
    
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
