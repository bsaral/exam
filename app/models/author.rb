class Author < User
	has_and_belongs_to_many :questions, class_name: 'Question', join_table: 'users_questions', association_foreign_key: 'question_id', foreign_key: 'user_id'
end
