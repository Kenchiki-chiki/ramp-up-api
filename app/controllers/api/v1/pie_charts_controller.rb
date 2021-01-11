class Api::V1::PieChartsController < ApplicationController
  def index
    bySkillStudyTimesArray = []
    bySkillStudyTimesHash = current_api_v1_user.skills.joins(:study_times).group(:name).sum(:study_hour)
    bySkillStudyTimesArray << bySkillStudyTimesHash.keys
    bySkillStudyTimesArray << bySkillStudyTimesHash.values
    bySkillStudyTimesArray2 = []
    
    bySkillStudyTimesArray << bySkillStudyTimesHash.to_a
    # binding.pry

    # [{rails: 4, vue: 7}]
    # {rails: 4, vue: 7}
    # [["rails", 4], ["vue", 7]]
  
    render json: bySkillStudyTimesArray, status: :created

  end
end
