class Api::V1::PieChartsController < ApplicationController
  def index
    byCategoryStudyTimes = []

    # byCategoryStudyTimes << current_api_v1_user.skills.joins(:study_times).group(:skill).sum(:study_hour)
    byCategoryStudyTimes << current_api_v1_user.skills.joins(:study_times).select('owners.*, study_times.*').group(:skill).sum(:study_hour)
    binding.pry
    render json: byCategoryStudyTimes, status: :created

  end
end
