# frozen_string_literal: true

class AddDescriptionToDocument < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :description, :text
  end
end
