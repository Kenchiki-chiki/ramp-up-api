class Api::V1::BarChartsController < ApplicationController
  def index
    monthlyStudyTimes = []
    now = Time.current(1..11).each do |i|
      monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(i.month)} ).sum(:study_hour)
    end
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Time.now.all_month} ).sum(:study_hour)
    render json: monthlyStudyTimes, status: :created
  end
end






