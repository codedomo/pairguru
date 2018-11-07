require "rails_helper"

describe "Comments requests", type: :request do
  describe "comments list" do
    let!(:movies) { create_list(:movie, 5, :with_comments) }

    it "displays only related comments" do
      visit "/movies/" + movies.sample.id.to_s
      expect(page).to have_selector(".media", count: 5)
    end
  end
end
