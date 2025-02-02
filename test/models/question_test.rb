# frozen_string_literal: true

require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  fixtures :quizzes, :questions, :quiz_questions, :answers, :tags, :taggables

  def setup
    @question = questions(:question_one)
  end

  test "should be valid" do
    assert @question.valid?
  end

  test "should require a statement" do
    @question.statement = nil
    assert_not @question.valid?, "Question is valid without a statement"
    assert_includes @question.errors[:statement], "can't be blank"
  end

  test "should require a kind" do
    @question.kind = nil
    assert_not @question.valid?, "Question is valid without a kind"
    assert_includes @question.errors[:kind], "can't be blank"
  end

  test "should have many quiz_questions" do
    assert_respond_to @question, :quiz_questions
  end

  test "should have many quizzes through quiz_questions" do
    assert_respond_to @question, :quizzes
  end

  test "should have many taggables" do
    assert_respond_to @question, :taggables
  end

  test "should destroy associated taggables when question is destroyed" do
    assert_difference "Taggable.count", -@question.taggables.count do
      @question.destroy
    end
  end

  test "should destroy associated quiz_questions when question is destroyed" do
    assert_difference "QuizQuestion.count", -@question.quiz_questions.count do
      @question.destroy
    end
  end

  test "should have correct enum values for kind" do
    assert_equal 0, Question.kinds[:multiple_choice]
    assert_equal 1, Question.kinds[:essay]
  end
end
