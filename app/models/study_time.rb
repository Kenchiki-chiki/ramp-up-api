class StudyTime < ApplicationRecord
  validates :study_hour, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }, allow_blank: true
  belongs_to :skill
end
