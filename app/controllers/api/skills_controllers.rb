module Api
  module V1
    class SkillsController < ApplicationController

      def index
        skills = Skill.all
        render json: skills
      end
      
      def create
        skill = Skill.new(skill_params)
        if skill.save
          render json: skill, status: :create
        else
          render json: skill.errors, status: :unprocessable_entity
        end
      end



      private
      def skill_params
        params.require(:skill).permit(:name)
      end

    end
  end
end