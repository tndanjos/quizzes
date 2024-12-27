# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :quiz_questions
  has_many :answers, dependent: :destroy
  has_many :taggables, as: :taggable, dependent: :destroy

  has_many :tags, through: :taggables
  has_many :quizzes, through: :quiz_questions, dependent: :destroy

  validates :statement, presence: true
  validates :kind, presence: true
  validates :allow_multiple_answers, inclusion: { in: [ true, false ] }

  enum kind: { multiple_choice: 0, essay: 1 }
end
