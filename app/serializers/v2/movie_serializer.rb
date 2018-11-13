module V2
  class MovieSerializer < BaseSerializer
    attributes :id, :title
    belongs_to :genre, serializer: GenreSerializer
  end
end
