# frozen_string_literal: true

require "test_helper"

class QuizQuestionTest < ActiveSupport::TestCase
  fixtures :quizzes, :questions, :quiz_questions, :answers, :tags, :taggables

  def setup
    @quiz_question = quiz_questions(:quiz_question_one)
  end

  test "should be valid" do
    assert @quiz_question.valid?
  end

  test "should require a quiz" do
    @quiz_question.quiz = nil
    assert_not @quiz_question.valid?, "Quiz question is valid without a quiz"
    assert_includes @quiz_question.errors[:quiz], "must exist"
  end

  test "should require a question" do
    @quiz_question.question = nil
    assert_not @quiz_question.valid?, "Quiz question is valid without a question"
    assert_includes @quiz_question.errors[:question], "must exist"
  end

  test "should belong to quiz" do
    assert_respond_to @quiz_question, :quiz
  end

  test "should belong to question" do
    assert_respond_to @quiz_question, :question
  end
end
