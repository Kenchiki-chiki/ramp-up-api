class Api::V1::CalendarsController < ApplicationController
  def index
    # totalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)

    # render json: totalStudyTimes, status: :created
  end
end
