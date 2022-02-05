# frozen_string_literal: true

module JsonSchemas
  # Document
  def document_json_types
    {
      created_at: :date,
      description: :string,
      id: :integer,
      title: :string,
      updated_at: :date
    }
  end

  def document_json(document)
    {
      created_at: date { |_| expect(document.created_at).to be_within(1.second).of Time.zone.now },
      description: document.description,
      id: document.id,
      title: document.title,
      updated_at: date { |_| expect(document.updated_at).to be_within(1.second).of Time.zone.now }
    }
  end
end
