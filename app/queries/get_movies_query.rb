class GetMoviesQuery
  class << self
    def call
      Movie.all
    end
  end
end
