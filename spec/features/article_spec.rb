RSpec.feature "Article" do
  background do
    FactoryGirl.create(:article)
  end

  scenario "Can create Article" do
    visit '/articles/new'
    within("#new_article") do
      fill_in 'article_title', with: 'MyString'
      fill_in 'article_body', with: 'body body body body'
    end
    click_button 'Go'
    expect(page).to have_content 'MyString MyString'
  end

  scenario "Search with invalid params" do
    visit '/search'
    within("#search") do
      fill_in 'q', with: 'Xunda'
    end
    click_button 'Go'
    expect(page).to have_content 'No Results'
  end
end
