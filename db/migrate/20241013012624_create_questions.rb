# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.text :statement, null: false
      t.integer :kind, null: false, default: 0
      t.text :tip
      t.boolean :allow_multiple_answers, default: false

      t.timestamps
    end
  end
end
