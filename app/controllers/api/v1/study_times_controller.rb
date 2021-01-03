class Api::V1::StudyTimesController < ApplicationController
  def index
    totalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)

    render json: totalStudyTimes, status: :created
  end

  

  def create

    studyTime = StudyTime.transaction do
      params[:study_times].each do |param|
        next if param[:study_hour].blank?
        existingStudyTime = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).sum(:study_hour)
        # binding.pry
        paramStudyTime = param[:study_hour].to_i
        # binding.pry
        studyTime = existingStudyTime + paramStudyTime
        # binding.pry
        
        if studyTime <= 24         
            skill =current_api_v1_user.skills.find(param[:skill_id])
            skill.study_times.create!(study_hour: param[:study_hour], studied_on: Date.current)
        else
          raise "1日の学習時間が24時間を超えています。"
          render json: { error: studyTime.errors.full_messages }
        end

      end
    end
    
    # totalStudyTimes = Skill.joins(:study_times).where(study_times: { studied_on: Date.current}, user_id: current_api_v1_user.id ).pluck(:study_hour)
    totalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)

    render json: totalStudyTimes, status: :created


  end

  # existingStudyTime = StudyTime.where(studied_on: Date.current).sum(:study_hour)
  # paramStudyTime = param[:study_hour]
  # StudyTime = existingStudyTime + paramStudyTime
  

  def study_time_params

    # Parameters: { study_time => {skill_id: 1, study_hour: 4}, {skill_id: 2, study_hour: 6,}}
    #params.permit(study_time: [])
  end
end