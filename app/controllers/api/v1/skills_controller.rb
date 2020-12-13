class Api::V1::SkillsController < ApplicationController

  def index
    skills = Skill.all
    render json: skills
  end

  def create
    Skill.transaction do
      skill_params[:names].each do |name|
        current_user.skills.create!(name: name)
      end
    end

    render status: :created, body: nil
  end

  private

  def skill_params
    params.require(:skill).permit(names:[])
  end
end
