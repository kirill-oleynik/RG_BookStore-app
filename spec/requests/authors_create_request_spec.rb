# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  describe 'POST /authors' do
    context 'when params are vlid' do
      let(:params) { { name: 'author_name', bio: 'author_bio' } }
      before { post authors_path params: params }
      it 'creates author with given attributes' do
        expect(response).to have_http_status(200)
        expect(response.location).not_to be_blank
        expect(Author.count).to eq(1)
        expect(Author.first.name).to eq('author_name')
        expect(Author.first.bio).to eq('author_bio')
      end
    end
    context 'when params are invalid' do
      before { post authors_path params: {} }
      it 'creates does not create an author' do
        expect(response).to have_http_status(422)
        expect(Author.count).to eq(0)
      end
    end
  end
end
