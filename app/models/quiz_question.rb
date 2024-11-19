# frozen_string_literal: true

class QuizQuestion < ApplicationRecord
  belongs_to :quiz
  belongs_to :question

  validates :quiz_id, presence: true
  validates :question_id, presence: true
end
