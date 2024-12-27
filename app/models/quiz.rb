# frozen_string_literal: true

class Quiz < ApplicationRecord
  has_many :quiz_questions
  has_many :taggables, as: :taggable, dependent: :destroy
  has_many :questions, through: :quiz_questions, dependent: :destroy

  validates :title, presence: true
end
