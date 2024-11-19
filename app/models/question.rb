# frozen_string_literal: true

class Question < ApplicationRecord
  TYPES = %w[MultipleChoice Essay].freeze

  has_many :quiz_questions
  has_many :answers
  has_many :taggables, as: :taggable, dependent: :destroy
  has_many :quizzes, through: :quiz_questions

  validates :statement, presence: true
  validates :type, presence: true, inclusion: { in: TYPES }
  validates :allow_multiple_answers, inclusion: { in: [ true, false ] }

  enum type: { multiple_choice: 0, essay: 1 }
end
