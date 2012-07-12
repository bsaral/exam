class CreateExamInfos < ActiveRecord::Migration
  def change
    create_table :exam_infos do |t|
      t.integer :exam_id
      t.integer :user_id
      t.datetime :time_start
      t.datetime :time_finish
      t.datetime :time_finish_student

      t.timestamps
    end
  end
end
