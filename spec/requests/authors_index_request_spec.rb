# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  setup { host! 'api.example.com' }
  describe 'GET /authors' do
    before { create_list(:author, 2) }
    context 'without arguments' do
      it 'returns all author entities' do
        get authors_path
        expect(response).to have_http_status(200)
        authors = JSON.parse(response.body)
        expect(authors.length).to eq(2)
        expect(response).to match_json_schema('authors_index')
      end
    end
    context 'whith emptystrings params' do
      let(:params) { { name: '', bio: '' } }
      it 'returns all author entities' do
        get authors_path, params: params
        expect(response).to have_http_status(200)
        authors = JSON.parse(response.body)
        expect(authors.length).to eq(2)
      end
    end
  end
end
