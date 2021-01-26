class Skill < ApplicationRecord
  validates :name, length: { maximum: 24 }
  belongs_to :user
  has_many :study_times, dependent: :destroy
end
