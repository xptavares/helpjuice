require 'elasticsearch/model'

class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :body, presence: true
end
