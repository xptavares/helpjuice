require 'rails_helper'

RSpec.describe Article, type: :model do
  subject { FactoryGirl.build(:article) }
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).case_insensitive }
    it { should validate_presence_of(:body) }
  end
end
