class Api::V1::CalendarsController < ApplicationController
  def index

    clickedDate = params[:date].to_date
    tahtDayTotalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: clickedDate} ).pluck(:study_hour)

    render json: tahtDayTotalStudyTimes, status: :created
  end
end
