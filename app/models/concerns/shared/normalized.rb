module Shared::Normalizer extend ActiveSupport::Concern
  attributes.each do |column, value|
    #
    # convert empty string to null value in order for SQL table to work, otherwise key constraints may fail
    #
    self[column] = nil if self[column].kind_of? String and self[column].empty?
  end
end