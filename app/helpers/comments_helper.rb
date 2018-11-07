module CommentsHelper
  def owner?(comment)
    current_user == comment.user
  end

  def already_posted?(movie)
    current_user.already_posted?(movie)
  end
end
