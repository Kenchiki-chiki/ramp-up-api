class Api::V1::StudyTimesController < ApplicationController
  def index
    total_study_times = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)

    render json: total_study_times, status: :created
  end

  MAX_STUDY_HOURS = 24

  def create
    study_time = 0
    StudyTime.transaction do
      params[:study_times].each do |param|
        next if param[:study_hour].blank?
        existing_study_time = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).sum(:study_hour)
        param_study_time = param[:study_hour].to_i
        study_time = existing_study_time + param_study_time

        if study_time <= MAX_STUDY_HOURS
            skill = current_api_v1_user.skills.find(param[:skill_id])
            skill.study_times.create(study_hour: param[:study_hour], studied_on: Date.current)
        else
          raise ActiveRecord::Rollback
        end

      end
    end

    if study_time > MAX_STUDY_HOURS
      render json: { errors: ["1日の学習時間が24時間を超えています。"] }, status: :created
    else
      total_study_times = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)

      render json: total_study_times, status: :created
    end
  end
end