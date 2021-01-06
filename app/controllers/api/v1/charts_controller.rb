class Api::V1::ChartsController < ApplicationController
  def index
    monthlyStudyTimes = []
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Time.now.all_month} ).sum(:study_hour)
    # binding.pry
    render json: monthlyStudyTimes, status: :created


  end


end
