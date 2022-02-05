# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Document, type: :model do
  subject { build(:document) }

  it 'generates a valid factory' do
    expect(subject).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end
end
