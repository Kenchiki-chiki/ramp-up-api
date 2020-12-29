class Api::V1::StudyTimesController < ApplicationController
  def index

  end

  def create
    StudyTime.transaction do
      params[:study_times].each do |param|
        next if param[:study_hour].blank?
        skill = current_user.skills.find(param[:skill_id])
        skill.study_times.create!(study_hour: param[:study_hour], studied_on: Date.current)
      end
    end
    #binding.pry
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

    # Parameters: { study_time => [{skill_id: 1, study_hour: 4}, {skill_id: 2, study_hour: 6}] }
    #params.permit(study_time: [])
  end
end