class Task < ApplicationRecord
  validates :name, length: { maximum: 40 }
  belongs_to :user

  MAX_LENGTH_OF_NAME = 40

  def self.under_max_length?(task)
    task.length <= 40
  end
end
