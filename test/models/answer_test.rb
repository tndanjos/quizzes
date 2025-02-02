# frozen_string_literal: true

require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  fixtures :quizzes, :questions, :quiz_questions, :answers

  def setup
    @answer = answers(:answer_one)
  end

  test "should be valid" do
    assert @answer.valid?
  end

  test "should require a question_id" do
    @answer.question_id = nil
    assert_not @answer.valid?, "Answer is valid without a question_id"
    assert_includes @answer.errors[:question_id], "can't be blank"
  end

  test "should require a response" do
    @answer.response = nil
    assert_not @answer.valid?, "Answer is valid without a response"
    assert_includes @answer.errors[:response], "can't be blank"
  end

  test "should require a correct value" do
    @answer.correct = nil
    assert_not @answer.valid?, "Answer is valid without a correct value"
    assert_includes @answer.errors[:correct], "can't be blank"
  end

  test "should belong to question" do
    assert_respond_to @answer, :question
  end
end
