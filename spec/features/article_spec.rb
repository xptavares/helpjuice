RSpec.feature "Article" do
  background do
    FactoryGirl.create(:article)
  end

  scenario "Can create Article" do
    visit '/articles/new'
    within("#new_article") do
      fill_in 'article_title', with: 'New Title New Title'
      fill_in 'article_body', with: 'body body body body'
    end
    click_button 'Create Article'
    expect(page).to have_content 'Article was successfully created.'
  end

  scenario "Search with invalid params" do
    article = Article.last
    visit "/articles/#{article.slug}/edit"
    within("#edit_article_#{article.id}") do
      fill_in 'article_title', with: 'New Title New Title'
      fill_in 'article_body', with: 'body body body body'
    end
    click_button 'Update Article'
    expect(page).to have_content 'Article was successfully updated.'
  end

  scenario "Direct entry by valid slug" do
    article = Article.last
    visit "/#{article.slug}"
    expect(page).to have_content 'MyString MyString'
  end

  scenario "Direct entry by valid slug" do
    visit "/mystring"
    expect(page).to have_content 'MyString MyString'
    expect(page).to have_content 'Articles Search'
  end
end
