# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    before { FactoryBot.build(:author) }
    it { should validate_presence_of(:name) }
    it { validate_uniqueness_of(:name).case_insensitive }
  end
  describe 'instance methods' do
    let(:author) { build(:author) }
    it { expect(author).to respond_to(:name) }
    it { expect(author).to respond_to(:name=) }
    it { expect(author).to respond_to(:bio) }
    it { expect(author).to respond_to(:bio=) }
  end
end
