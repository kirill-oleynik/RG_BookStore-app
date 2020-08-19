# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  describe 'DELETE /authors' do
    let!(:author) { create(:author) }
    context 'when requested entity exists' do
      it 'deletes entity & returns expected response' do
        delete "/authors/#{author.id}"
        expect(response).to have_http_status(204)
        expect(Author.find_by_id(author.id)).to be_nil
      end
    end
    describe 'when requested entity does not exist' do
      let!(:author) { create(:author) }
      it 'returns 404 error response' do
        delete "/authors/#{author.id + rand(10)}"
        expect(response).to have_http_status(404)
      end
    end
  end
end
