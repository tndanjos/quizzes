# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[7.2]
  def change
    create_table :tags do |t|
      t.string :name, null:false
      t.string :color, null:false

      t.timestamps
    end
  end
end
