# frozen_string_literal: true

class RemoveAllowMultipleAnswersOnQuestion < ActiveRecord::Migration[7.2]
  def change
    remove_column :questions, :allow_multiple_answers, :boolean
  end
end
