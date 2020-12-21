class CreateStudyTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :study_times do |t|
      t.references :skill, null: false, foreign_key: true
      t.float :study_hour
      t.date :studied_on

      t.timestamps
    end
  end
end
