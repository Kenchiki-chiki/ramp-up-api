class Api::V1::SkillsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    skills = current_api_v1_user.skills
    render json: skills
  end

  MAX_LENGTH_OF_SKILL_NAME = 24

  def create
    errors = []
    skills = []

    Skill.transaction do
      if skill_params[:_json].all?{ |value| value === "" }
        errors << "スキルが入力されていません。"
      end

      skills = skill_params[:_json].compact.reject(&:empty?).each do |name|
        if name.length <= MAX_LENGTH_OF_SKILL_NAME
          current_api_v1_user.skills.create!(name: name)
        else
          errors << "24文字以下で入力してください。"
          raise ActiveRecord::Rollback
        end
      end

      if errors.present?
        raise ActiveRecord::Rollback
      end
    end

    if errors.present?
      render json: { errors: errors }, status: :created
    else
      render json: skills, status: :created
    end
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


