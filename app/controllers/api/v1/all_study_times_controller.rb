class Api::V1::AllStudyTimesController < ApplicationController
  LONG_STUDY_HOURS = 8
  MIDDLE_STUDY_HOURS = 4
  ZERO_STUDY_HOURS = 0
  def index
    all_study_times_hashs = current_api_v1_user.study_times.select('SUM(study_hour) as total_study_hour, studied_on').group(:studied_on).map{|s| {total_study_hour: s.total_study_hour, studied_on: s.studied_on}}
    
    all_study_times_color_hashs = all_study_times_hashs.each do |hash|
      if hash[:total_study_hour] >= LONG_STUDY_HOURS
        hash["color"] = "rgba(102, 200, 232, 0.9)"
      elsif hash[:total_study_hour] >= MIDDLE_STUDY_HOURS
        hash["color"] = "rgba(255, 196, 12, 0.9)"
      elsif hash[:total_study_hour] > ZERO_STUDY_HOURS
        hash["color"] = "rgba(248, 121, 121, 0.9)"
      else

      end
    end

    render json: all_study_times_color_hashs, status: :created
  end
end