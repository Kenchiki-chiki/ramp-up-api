class Skill < ApplicationRecord
  belongs_to :user
  has_many :study_times
end
