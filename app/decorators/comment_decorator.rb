class CommentDecorator < Draper::Decorator
  delegate_all
  decorates_association :movies

  def number_of_movies
    object.movies.count
  end

  def formatted_creation_date
    object.created_at.to_formatted_s(:long)
  end
end
