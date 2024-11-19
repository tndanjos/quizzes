# frozen_string_literal: true

require "test_helper"

class QuizTest < ActiveSupport::TestCase
  # Setup para criar uma instância válida de Quiz
  def setup
    @quiz = Quiz.new(title: "Sample Quiz", description: "A quiz for testing purposes")
  end

  # Testando se um Quiz válido pode ser salvo
  test "should be valid" do
    assert @quiz.valid?
  end

  # Testando a validação de presença do título
  test "should require a title" do
    @quiz.title = nil
    assert_not @quiz.valid?, "Quiz is valid without a title"
    assert_includes @quiz.errors[:title], "can't be blank"
  end

  # Testando a associação com quiz_questions
  test "should have many quiz_questions" do
    assert_respond_to @quiz, :quiz_questions
  end

  # Testando a associação com questions através de quiz_questions
  test "should have many questions through quiz_questions" do
    assert_respond_to @quiz, :questions
  end

  # Testando a associação polimórfica com taggables
  test "should have many taggables" do
    assert_respond_to @quiz, :taggables
  end

  # Testando se a destruição de um Quiz também destrói os taggables associados
  test "should destroy associated taggables when quiz is destroyed" do
    @quiz.save
    @quiz.taggables.create!(tag: tags(:one)) # tags(:one) vem do fixtures
    assert_difference "Taggable.count", -1 do
      @quiz.destroy
    end
  end

  # Testando se a destruição de um Quiz também destrói os quiz_questions associados
  test "should destroy associated quiz_questions when quiz is destroyed" do
    @quiz.save
    @quiz.quiz_questions.create!(question: questions(:one)) # questions(:one) vem do fixtures
    assert_difference "QuizQuestion.count", -1 do
      @quiz.destroy
    end
  end
end
