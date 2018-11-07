require 'rails_helper'

describe Comment do
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:movie_id) }
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user) }
  it { should belong_to(:movie) }

  describe "adding comment" do
    let!(:movie) { create(:movie) }
    let!(:user) { create(:user) }

    it "creates first comment" do
      Comment.create!(content: 'Lorem ipsum', user: user, movie: movie)
      expect(movie.comments.count).to eq(1)
    end

    it "doesn't create second comment under same movie and the same user" do
      Comment.create!(content: 'Lorem ipsum', user: user, movie: movie)
      expect {
        Comment.create!(content: 'Lorem ipsum', user: user, movie: movie)
      }.to raise_error(
        ActiveRecord::RecordInvalid,
        "Validation failed: User may only write one comment per movie."
      )
    end
  end
end
