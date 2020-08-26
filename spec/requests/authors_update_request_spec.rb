# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  let!(:author) { create(:author, name: 'name_1', bio: 'bio_1') }
  let(:params) { { name: 'name_2', bio: 'bio_2' } }
  describe 'PUT authors/:id' do
    context 'when author exitsts' do
      it 'updates author and returns correct response' do
        put "/authors/#{author.id}", params: params
        expect(response).to have_http_status(200)
        expect(
          JSON.parse(response.body)['name']
        ).to eq('name_2')
        expect(
          JSON.parse(response.body)['bio']
        ).to eq('bio_2')
        expect(response).to match_json_schema('authors_show')
        expect(response.location).not_to be_blank
      end
    end
    context 'when entity does not exist' do
      it 'return 404 error' do
        put "/authors/#{author.id + rand(10)}", params: params
        expect(response).to have_http_status(404)
      end
    end
  end
end
