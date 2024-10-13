# frozen_string_literal: true

class CreateTaggables < ActiveRecord::Migration[7.2]
  def change
    create_table :taggables do |t|
      t.references :tag, null:false, foreign_key: true
      t.references :taggable, polymorphic: true, null:false

      t.timestamps
    end
  end
end
