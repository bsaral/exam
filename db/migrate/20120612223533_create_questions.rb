class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :question
      t.string :answer

      t.timestamps
    end
  end
end
