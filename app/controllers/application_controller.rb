# frozen_string_literal: true

class ApplicationController < ActionController::API
  protect_from_forgery_with :null_session
end
