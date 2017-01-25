class SearchController < ApplicationController
  def search
    query_params = params[:q]
    @articles = query_params.present? ? Article.search(query_params) : []
  end
end
