class Api::V1::PieChartsController < ApplicationController
  def index
    by_skill_study_times_array = []
    by_skill_study_times_hash = current_api_v1_user.skills.joins(:study_times).group(:name).sum(:study_hour)
    by_skill_study_times_array << by_skill_study_times_hash.keys
    by_skill_study_times_array << by_skill_study_times_hash.values
    by_skill_study_times_array2 = []   
    by_skill_study_times_array << by_skill_study_times_hash.to_a
  
    render json: by_skill_study_times_array, status: :created

  end
end
