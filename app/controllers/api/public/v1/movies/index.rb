module API
  module Public
    module V1
      module Movies
        class Index < Base
          desc "Return all movies"
          get do
            GetMoviesQuery.call
          end
        end
      end
    end
  end
end
