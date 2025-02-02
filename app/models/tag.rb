# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggables
  has_many :questions, through: :taggables, source: :taggable, source_type: "Question"
  has_many :quizzes, through: :taggables, source: :taggable, source_type: "Quiz"

  validates :name, presence: true
  validates :color, presence: true
end
