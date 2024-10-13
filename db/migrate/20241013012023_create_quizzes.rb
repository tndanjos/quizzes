# frozen_string_literal: true

class CreateQuizzes < ActiveRecord::Migration[7.2]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end
