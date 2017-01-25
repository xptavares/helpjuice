RSpec.feature "Search Article" do
  background do
    FactoryGirl.create(:article)
  end

  scenario "Search with valid params" do
    visit '/search'
    within("#search") do
      fill_in 'q', with: 'MyString'
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
