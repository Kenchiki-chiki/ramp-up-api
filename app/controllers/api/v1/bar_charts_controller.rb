class Api::V1::BarChartsController < ApplicationController
  def index
    monthly_study_times = []
    now = Time.current
    (1..11).reverse_each do |i|
      monthly_study_times << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(i.month).all_month} ).sum(:study_hour)
    end
    monthly_study_times << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Time.now.all_month} ).sum(:study_hour)
    render json: monthly_study_times, status: :created
  end
end