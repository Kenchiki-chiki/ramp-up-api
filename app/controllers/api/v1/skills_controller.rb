class Api::V1::SkillsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    # createdメソッドで叩く→nuxtに返してvuexに保存

    # 今ログインしているユーザーに紐づくスキルをDBから配列で取得
    # skills = Skill.where(name: current_api_v1_user.skills.name).pluck(:name)
    skills = current_api_v1_user.skills
    # binding.pry
    render json: skills

    # skills = current_api_v1_user.skills
    # render json: skills
  end
  def create
    skillName = Skill.transaction do
      skill_params[:_json].compact.reject(&:empty?).each do |name|
        current_api_v1_user.skills.create!(name: name)
      end
    end
    render json: skillName, status: :created
  end

  private

  def skill_params
    params.permit(_json:[])
  end
end


