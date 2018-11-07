class Comment < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :user_id, uniqueness: { scope: :movie_id, message: 'may only write one comment per movie.' }
  validates :user_id, :movie_id, :content, presence: true

  delegate :name, :image, to: :user, prefix: true
end
