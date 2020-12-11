class Api::V1::SkillsController < ApplicationController

  def index
    skills = Skill.all
    render json: skills
  end

  def create
    binding.pry
    # skill = Skill.new(skill_params)
    # skill_params = params[:skill_params]

    skills =
      skill_params.each do |skill_param|
        skill = Skill.new(skill_param)
        skill.save
      end

    if skills.present?
      render json: skill, status: :create
    else
      render json: skill.errors, status: :unprocessable_entity
    end
  end

  private

  def skill_params
    params.require(:skill).permit(names:[])
  end
end