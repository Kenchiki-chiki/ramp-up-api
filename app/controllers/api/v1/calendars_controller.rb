class Api::V1::CalendarsController < ApplicationController
  def index
    clicked_date = params[:date].to_date
    taht_day_total_study_times = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: clicked_date} ).pluck(:study_hour)

    render json: taht_day_total_study_times, status: :created
  end
end
