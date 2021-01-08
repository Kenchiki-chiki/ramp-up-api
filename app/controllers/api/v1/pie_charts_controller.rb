class Api::V1::PieChartsController < ApplicationController
  def index
    bySkillStudyTimes = []
    bySkillStudyTimes << current_api_v1_user.skills.joins(:study_times).group(:name).sum(:study_hour)
  
    render json: bySkillStudyTimes, status: :created

  end
end
