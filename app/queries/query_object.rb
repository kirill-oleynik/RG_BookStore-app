# frozen_string_literal: true

# author entity request logic
class AueryObject
  attr_reader :scope, :params

  def initialize(scope:, params: {})
    @scope = scope
    @params = params
  end

  def call
    return []
  end
end
