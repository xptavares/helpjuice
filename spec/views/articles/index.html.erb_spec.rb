require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        title: "Title2",
        body: "MyText"
      ),
      Article.create!(
        title: "Title3",
        body: "MyText"
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "h3", count: 2
  end
end
