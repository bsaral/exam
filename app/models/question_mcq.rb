class QuestionMCQ < Question
	has_and_belongs_to_many :authors, class_name: 'User', join_table: 'users_questions', association_foreign_key: 'user_id', foreign_key: 'question_id'
end
