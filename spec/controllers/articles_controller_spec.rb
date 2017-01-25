require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:valid_attributes) do
    { title: "MyString", body: "MyText" }
  end
  let(:invalid_attributes) do
    { title: "", body: "" }
  end

  describe "GET index" do
    it "assigns all articles as @articles" do
      article = Article.create! valid_attributes
      get :index
      expect(assigns(:articles)).to include article
    end
  end

  describe "GET show" do
    it "assigns the requested article as @article" do
      article = Article.create! valid_attributes
      get :show, params: { id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "GET new" do
    it "assigns a new article as @article" do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "GET edit" do
    it "assigns the requested article as @article" do
      article = Article.create! valid_attributes
      get :edit, params: { id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Article" do
        expect {
          post :create, params: { article: valid_attributes }
        }.to change(Article, :count).by(1)
      end

      it "assigns a newly created article as @article" do
        post :create, params: { article: valid_attributes }
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end

      it "redirects to the created article" do
        post :create, params: { article: valid_attributes }
        expect(response).to redirect_to(assigns(:article))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        post :create, params: { article: invalid_attributes }
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "re-renders the 'new' template" do
        post :create, params: { article: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) do
        { body: "Just superman" }
      end

      it "updates the requested article" do
        article = Article.create! valid_attributes
        put :update, params: { id: article.to_param, article: new_attributes }
        article.reload
        expect(article.body).to eq(new_attributes[:body])
      end

      it "assigns the requested article as @article" do
        article = Article.create! valid_attributes
        put :update, params: { id: article.to_param, article: new_attributes }
        expect(assigns(:article)).to eq(article)
      end

      it "redirects to the article" do
        article = Article.create! valid_attributes
        put :update, params: { id: article.to_param, article: new_attributes }
        expect(response).to redirect_to(assigns(:article))
      end
    end

    describe "with invalid params" do
      it "assigns the article as @article" do
        article = Article.create! valid_attributes
        put :update, params: { id: article.to_param, article: invalid_attributes }
        expect(assigns(:article)).to eq(article)
      end

      it "re-renders the 'edit' template" do
        article = Article.create! valid_attributes
        put :update, params: { id: article.to_param, article: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested article" do
      article = Article.create! valid_attributes
      expect {
        delete :destroy, params: { id: article.to_param }
      }.to change(Article, :count).by(-1)
    end

    it "redirects to the articles list" do
      article = Article.create! valid_attributes
      delete :destroy, params: { id: article.to_param }
      expect(response).to redirect_to(articles_url)
    end
  end
end
