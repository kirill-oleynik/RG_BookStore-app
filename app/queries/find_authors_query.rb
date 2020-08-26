# frozen_string_literal: true

require 'query_object.rb'
# author entity request logic
class FindAuthors < AueryObject
  def call
    return scope.where(
      'name like ? or bio like ?',
      "%#{name}%",
      "%#{bio}%"
    )
  end

  private

  def name
    return params.fetch(:name) { '' }
  end

  def bio
    return params.fetch(:bio) { '' }
  end
end
