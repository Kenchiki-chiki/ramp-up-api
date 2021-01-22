class Api::V1::StudyTimesController < ApplicationController
  def index
    totalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)

    render json: totalStudyTimes, status: :created
  end

  def create
    studyTime = 0
    StudyTime.transaction do
      params[:study_times].each do |param|
        next if param[:study_hour].blank?
        existingStudyTime = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).sum(:study_hour)
        # binding.pry
        paramStudyTime = param[:study_hour].to_i
        # binding.pry
        studyTime = existingStudyTime + paramStudyTime
        # binding.pry

        if studyTime <= 24
            skill = current_api_v1_user.skills.find(param[:skill_id])
            skill.study_times.create(study_hour: param[:study_hour], studied_on: Date.current)
        else
          raise ActiveRecord::Rollback
        end

      end
    end

    if studyTime > 24
      render json: { errors: ["1日の学習時間が24時間を超えています。"] }, status: :created
    else
      totalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)

      render json: totalStudyTimes, status: :created
    end
  end
end