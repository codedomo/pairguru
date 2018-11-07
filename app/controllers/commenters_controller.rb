class CommentersController < ApplicationController
  def index
    @commenters = User.joins(:comments)
                    .where("comments.created_at >= ?", 1.week.ago.utc)
                    .order( "users.comments_count desc" )
                    .limit(10)
  end
end
