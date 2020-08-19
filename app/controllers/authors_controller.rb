# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :find_author, only: %i[update destroy]
  def create
    author = Author.new(author_params)
    if author.save
      render nothing: true, status: 200, location: author
    else
      render json: author.errors, status: 422
    end
  end

  def update
    if @author&.update(author_params)
      render json: @author, status: 200, location: @author
    else
      render json: @author.errors, status: 422
    end
  end

  def destroy
    @author.destroy
    head(204)
  end

  private

  def find_author
    @author = Author.find_by(id: params.require(:id))
    head(404) unless @author
  end

  def author_params
    params.permit(:name, :bio)
  end
end
