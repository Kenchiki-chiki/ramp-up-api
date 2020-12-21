class Api::V1::StudyTimesController < ApplicationController
  def index

  end

  def create
    studyTime = StudyTime.transaction do
      study_time_params[:_json].each do |study_hour|
        current_api_v1_user.skills.study_hour.create!(study_hour: study_hour)
      end
    end
    render json: studyTime, status: :created
    # render json: studyTime.all.sum(:study_hour), status: :created
  end

  def study_time_params
    
    # Parameters: {"_json"=>["4", "2.5", "", "", "", ""]}

    # Parameters: {"_json"=>[{skill_id: 1, study_hour: 4}}
    params.permit(_json:[])
  end
end