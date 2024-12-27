# frozen_string_literal: true

require "test_helper"

class TaggableTest < ActiveSupport::TestCase
  fixtures :quizzes, :questions, :quiz_questions, :answers, :tags, :taggables

  def setup
    @taggable = taggables(:taggable_one)
  end

  test "should be valid" do
    assert @taggable.valid?
  end

  test "should require a tag_id" do
    @taggable.tag_id = nil
    assert_not @taggable.valid?, "Taggable is valid without a tag_id"
    assert_includes @taggable.errors[:tag_id], "can't be blank"
  end

  test "should require a taggable_id" do
    @taggable.taggable_id = nil
    assert_not @taggable.valid?, "Taggable is valid without a taggable_id"
    assert_includes @taggable.errors[:taggable_id], "can't be blank"
  end

  test "should require a taggable_type" do
    @taggable.taggable_type = nil
    assert_not @taggable.valid?, "Taggable is valid without a taggable_type"
    assert_includes @taggable.errors[:taggable_type], "can't be blank"
  end

  test "should belong to tag" do
    assert_respond_to @taggable, :tag
  end

  test "should belong to taggable" do
    assert_respond_to @taggable, :taggable
  end
end
