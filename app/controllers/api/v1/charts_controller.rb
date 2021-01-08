class Api::V1::ChartsController < ApplicationController
  def index
    monthlyStudyTimes = []

    now = Time.current
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(11.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(10.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(9.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(8.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(7.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(6.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(5.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(4.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(3.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(2.month)} ).sum(:study_hour)
    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: now.ago(1.month)} ).sum(:study_hour)

    monthlyStudyTimes << current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Time.now.all_month} ).sum(:study_hour)

    
    # binding.pry
    render json: monthlyStudyTimes, status: :created


  end


end






