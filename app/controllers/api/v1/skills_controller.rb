class Api::V1::SkillsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    skills = Skill.all
    render json: skills
  end

  def create
    Skill.transaction do
      current_api_v1_user = User.find_by(email: request.headers[:Uid])
      binding.pry
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
