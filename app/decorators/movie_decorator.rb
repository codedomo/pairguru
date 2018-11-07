class MovieDecorator < Draper::Decorator
  delegate_all

  def cover
    "http://lorempixel.com/100/150/" +
      %w[abstract nightlife transport].sample +
      "?a=" + SecureRandom.uuid
  end

  def comment_placeholder
    'You can leave only one comment to the movie. You can create another only if you delete previous one.' if h.already_posted?(object)
  end
end
