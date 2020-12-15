class Api::V1::SkillsController < ApplicationController
  

  def index
    skills = Skill.all
    render json: skills
  end

  def create
    Skill.transaction do
      skill_params[:_json].each do |name|
        current_api_v1_user.skills.create!(name: name)
      end
    end
    render status: :created, body: nil
 end

  private

  def skill_params
    params.permit(_json:[])
  end
end
