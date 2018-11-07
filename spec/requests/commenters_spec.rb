require "rails_helper"

describe "Commenters requests", type: :request do
  describe "commenters list" do
    it "displays only top commenters" do
      create_list(:user, 12, :with_comments)
      visit "/commenters"
      expect(page).to have_selector(".comment-icon-box", count: 10)
    end

    it "it doesn't take into account comments older than 7 days" do
      create_list(:user, 12, :with_old_comments)
      visit "/commenters"
      expect(page).to have_selector(".comment-icon-box", count: 0)
    end
  end
end
