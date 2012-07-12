class RemoveEidFromExamInfos < ActiveRecord::Migration
  def up
    remove_column :exam_infos, :exam_infos
  end
end
