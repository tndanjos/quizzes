# frozen_string_literal: true

require "test_helper"

class QuizTest < ActiveSupport::TestCase
  fixtures :quizzes, :questions, :quiz_questions, :answers, :tags, :taggables

  def setup
    @quiz = quizzes(:quiz_one)
  end

  test "should be valid" do
    assert @quiz.valid?
  end

  test "should require a title" do
    @quiz.title = nil
    assert_not @quiz.valid?, "Quiz is valid without a title"
    assert_includes @quiz.errors[:title], "can't be blank"
  end

  test "should have many quiz_questions" do
    assert_respond_to @quiz, :quiz_questions
  end

  test "should have many questions through quiz_questions" do
    assert_respond_to @quiz, :questions
  end

  test "should have many taggables" do
    assert_respond_to @quiz, :taggables
  end

  test "should destroy associated taggables when quiz is destroyed" do
    assert_difference "Taggable.count", -@quiz.taggables.count do
      @quiz.destroy
    end
  end

  test "should destroy associated quiz_questions when quiz is destroyed" do
    assert_difference "QuizQuestion.count", -@quiz.quiz_questions.count do
      @quiz.destroy
    end
  end
end
