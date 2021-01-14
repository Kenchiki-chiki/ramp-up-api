class Api::V1::CalendarsController < ApplicationController
  def index
    
    # totalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: Date.current} ).pluck(:study_hour)

    # パターン１
    # tahtDayTotalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: params[:date].to_date} ).pluck(:study_hour)

    # パターン２
    clickedDate = params[:date].to_date
    tahtDayTotalStudyTimes = current_api_v1_user.skills.joins(:study_times).where(study_times: { studied_on: clickedDate} ).pluck(:study_hour)

    # binding.pry

    render json: tahtDayTotalStudyTimes, status: :created
  end
end


# パラメーター
# { calendar => { 2021/1/12 } }

# URLに日付を組み込む
# http://localhost:3000/that_day_study_time/20210119
# http://localhost:3000/that_day_study_time/2021/01/19
# http://localhost:3000/that_day_study_time/2021/1/19

# カレンダークリック→_date.vueに遷移