# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  has_many :taggables, as: :taggable, dependent: :destroy

  validates :question_id, presence: true
  validates :response, presence: true
  validates :correct, presence: true, inclusion: { in: [ true, false ] }
end
