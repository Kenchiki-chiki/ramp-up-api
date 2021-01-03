class StudyTime < ApplicationRecord
  MAX_DAY_HOUR = 24
  validates :study_hour, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 24 }, allow_blank: true
  belongs_to :skill

  validate :less_than_day_hour

  def less_than_day_hour
    study_hours = skill.user.study_times.where(studied_on: Date.current).sum(:study_hour)
    if (study_hours.to_i + study_hour) > MAX_DAY_HOUR
      errors.add(:study_hour, '合計24時間を超えています。')
    end
  end
end
