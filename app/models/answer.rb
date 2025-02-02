# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :question_id, presence: true
  validates :response, presence: true
  validates :correct, presence: true
end
