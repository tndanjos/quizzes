# frozen_string_literal: true

require "test_helper"

class TagTest < ActiveSupport::TestCase
  fixtures :quizzes, :questions, :quiz_questions, :tags, :taggables

  def setup
    @tag = tags(:tag_one)
  end

  test "should be valid" do
    assert @tag.valid?
  end

  test "should require a name" do
    @tag.name = nil
    assert_not @tag.valid?, "Tag is valid without a name"
    assert_includes @tag.errors[:name], "can't be blank"
  end

  test "should require a color" do
    @tag.color = nil
    assert_not @tag.valid?, "Tag is valid without a color"
    assert_includes @tag.errors[:color], "can't be blank"
  end

  test "should have many taggables" do
    assert_respond_to @tag, :taggables
  end

  test "should have many questions through taggables" do
    assert_respond_to @tag, :questions
  end

  test "should have many quizzes through taggables" do
    assert_respond_to @tag, :quizzes
  end
end
