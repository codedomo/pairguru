# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  released_at :datetime
#  avatar      :string
#  genre_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Movie < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :genre, counter_cache: true
  has_many :comments

  validates_with TitleBracketsValidator
  validates_associated :comments

  accepts_nested_attributes_for :comments, allow_destroy: true
end
