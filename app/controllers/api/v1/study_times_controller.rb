class Api::V1::StudyTimesController < ApplicationController
  def index
    totalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)

    render json: totalStudyTimes, status: :created
  end

  

  def create

    StudyTime.transaction do
      params[:study_times].each do |param|
        next if param[:study_hour].blank?
        skill =current_api_v1_user.skills.find(param[:skill_id])
        skill.study_times.create!(study_hour: param[:study_hour], studied_on: Date.current)
      end
    end
    
    # totalStudyTimes = Skill.joins(:study_times).where(study_times: { studied_on: Date.current}, user_id: current_api_v1_user.id ).pluck(:study_hour)
    totalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)
    binding.pry

    render json: totalStudyTimes, status: :created


  end
  

  def study_time_params

    # Parameters: { study_time => {skill_id: 1, study_hour: 4}, {skill_id: 2, study_hour: 6,}}
    #params.permit(study_time: [])
  end
end