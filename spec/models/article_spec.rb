require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { FactoryGirl.build(:article) }
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).case_insensitive }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug).case_insensitive }
  end

  describe "#generate_slug" do
    let(:title) { "Test abount Slug" }
    let(:slug) { "test-abount-slug" }
    subject { FactoryGirl.create(:article, title: title) }
    it { expected(subject.slug).to eq slug }
  end
end
