module Searchable
  extend ActiveSupport::Concern

  module ClassMethods

    def search(query)
      if query && query.include?(" ")
        queries = query.split(" ")
        where("first_name ILIKE ?", "%#{queries[0]}%")
        where("last_name ILIKE ?", "#{queries[1]}%")
      elsif query
        where("first_name ILIKE ?", "#{query}%")
        where("last_name ILIKE ?", "#{query}%")
        where("email ILIKE ?", "#{query}%")
      else
        where("")
      end
    end

  end


end