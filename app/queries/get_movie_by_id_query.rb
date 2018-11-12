class GetMovieByIdQuery
  def initialize(id)
    @id = id
  end

  def call
    Movie.find(id)
  end

  private

  attr_reader :id
end
