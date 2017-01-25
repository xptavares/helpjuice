require "rails_helper"

RSpec.describe ArticlesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/articles").to route_to("articles#index")
    end

    it "routes to #new" do
      expect(get: "/articles/new").to route_to("articles#new")
    end

    it "routes to #show" do
      expect(get: "/articles/title-slug").to route_to("articles#show", slug: "title-slug")
    end

    it "routes to #edit" do
      expect(get: "/articles/title-slug/edit").to route_to("articles#edit", slug: "title-slug")
    end

    it "routes to #create" do
      expect(post: "/articles").to route_to("articles#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/articles/title-slug").to route_to("articles#update", slug: "title-slug")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/articles/title-slug").to route_to("articles#update", slug: "title-slug")
    end

    it "routes to #destroy" do
      expect(delete: "/articles/title-slug").to route_to("articles#destroy", slug: "title-slug")
    end

  end
end
