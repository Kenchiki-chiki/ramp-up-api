class Api::V1::AllStudyTimesController < ApplicationController
  def index

    allStudyTimesHashs = current_api_v1_user.study_times.select('SUM(study_hour) as total_study_hour, studied_on').group(:studied_on).map{|s| {total_study_hour: s.total_study_hour, studied_on: s.studied_on}}
    
    allStudyTimesColorHashs = allStudyTimesHashs.each do |hash|
      if hash[:total_study_hour] >= 8
        hash["color"] = "rgba(102, 200, 232, 0.9)"
      elsif hash[:total_study_hour] >= 4
        hash["color"] = "rgba(255, 196, 12, 0.9)"
      elsif hash[:total_study_hour] > 0
        hash["color"] = "rgba(248, 121, 121, 0.9)"
      else

      end
    end

    render json: allStudyTimesColorHashs, status: :created
  end
end