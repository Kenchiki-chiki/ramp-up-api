class Api::V1::PieChartsController < ApplicationController
  def index
    bySkillStudyTimesArray = []
    bySkillStudyTimesHash = current_api_v1_user.skills.joins(:study_times).group(:name).sum(:study_hour)
    bySkillStudyTimesArray << bySkillStudyTimesHash.keys
    bySkillStudyTimesArray << bySkillStudyTimesHash.values
    bySkillStudyTimesArray2 = []   
    bySkillStudyTimesArray << bySkillStudyTimesHash.to_a
  
    render json: bySkillStudyTimesArray, status: :created

  end
end
