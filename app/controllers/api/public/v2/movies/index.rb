module API
  module Public
    module V2
      module Movies
        class Index < Base
          desc "Return all movies with related genres"
          get each_serializer: ::V2::MovieSerializer do
            GetMoviesQuery.call
          end
        end
      end
    end
  end
end
