# frozen_string_literal: true

class Document < ApplicationRecord
  validates :title, :description, presence: true
end
