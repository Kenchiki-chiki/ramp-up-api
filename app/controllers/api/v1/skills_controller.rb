class Api::V1::SkillsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    skills = current_api_v1_user.skills
    render json: skills
  end

  def create
    skillName = Skill.transaction do
      skill_params[:_json].compact.reject(&:empty?).each do |name|
        current_api_v1_user.skills.create!(name: name)
      end
    end
    render json: skillName, status: :created
  end

  def destroy
    skill = Skill.find(params[:id])
    if skill.destroy
      render json: skill
    end
  end

  private

  def skill_params
    params.permit(_json:[])
  end
end


