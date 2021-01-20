class Task < ApplicationRecord
  validates :name, length: { maximum: 40 }
  belongs_to :user
end
