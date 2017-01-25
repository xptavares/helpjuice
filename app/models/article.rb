require 'elasticsearch/model'

class Article < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :body, presence: true

  before_validation :generate_slug

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = title.tr(" ", "-").downcase if title
  end
end
