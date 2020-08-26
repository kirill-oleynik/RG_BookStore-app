# frozen_string_literal: true

require_relative '../../queries/find_authors_query.rb'
module API
  class AuthorsController < ApplicationController
    def index
      result = FindAuthors.new(scope: Author.all, params: search_params).call
      render json: result, status: 200
    end

    def show
      author = Author.find_by(id: params.require(:id))
      if author
        render json: author, status: 200
      else
        head(404)
      end
    end

    private

    def search_params
      params.permit(:name, :bio)
    end
  end
end
