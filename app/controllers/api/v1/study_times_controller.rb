class Api::V1::StudyTimesController < ApplicationController
  def index

  end

  def create
    binding.pry
    # studyTime = StudyTime.transaction do
    #   study_time_params[:_json].each do |study_hour|
    #     current_api_v1_user.skills.study_hour.create!(study_hour: study_hour)
    #   end
    # end
    # render json: studyTime, status: :created

    # render json: studyTime.all.sum(:study_hour), status: :created
  end

  def study_time_params
    
    # {"vue"=>"3", "rails"=>"0.5", "controller"=>"api/v1/study_times", "action"=>"create", "study_time"=>{}} permitted: false>
    # {"_json"=>["1", "0.5"], "controller"=>"api/v1/study_times", "action"=>"create", "study_time"=>{}} permitted: false>
    # {"0"=>"1.5", "1"=>"0.5", "controller"=>"api/v1/study_times", "action"=>"create", "study_time"=>{}} permitted: false>

    # Parameters: {{skill_id: 1, study_hour: 4, studied_on: 2020.12.26}, {skill_id: 2, study_hour: 6, studied_on: 2020.12.26}}
    params.permit(_json:[])
  end
end