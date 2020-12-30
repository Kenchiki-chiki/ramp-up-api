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

    StudyTime.transaction do
      params[:study_times].each do |param|
        next if param[:study_hour].blank?
        skill =current_api_v1_user.skills.find(param[:skill_id])
        skill.study_times.create!(study_hour: param[:study_hour], studied_on: Date.current)
      end
    end

    # render json: studyTime.all.sum(:study_hour), status: :created
  end

  def study_time_params
    
    # Parameters: { study_time => {skill_id: 1, study_hour: 4}, {skill_id: 2, study_hour: 6,}}
    #params.permit(study_time: [])
  end
end