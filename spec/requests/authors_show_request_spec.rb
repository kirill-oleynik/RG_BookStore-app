# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  setup { host! 'api.example.com' }

  describe 'GET /author/:id' do
    let!(:author) { create(:author, id: 13, name: 'Name', bio: 'bio') }
    context 'when entity exists' do
      it 'returns requested author' do
        get author_path(13)
        expect(response).to have_http_status(200)
        author_from_response = JSON.parse(response.body)
        expect(author_from_response['name']).to eq(author.name)
        expect(author_from_response['bio']).to eq(author.bio)
        expect(response).to match_json_schema('authors_show')
      end
      context 'when enxtity does not exist' do
        it 'returns requested author' do
          get author_path(rand(0))
          expect(response).to have_http_status(404)
          expect(response.body).to be_empty
        end
      end
    end
  end
end
