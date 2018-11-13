module API
  module Public
    module V2
      module Movies
        class Show < Base
          desc "Return movie by provided id with related genres"
          params do
            requires :id, type: Integer
          end
          get serializer: ::V2::MovieSerializer do
            GetMovieByIdQuery.new(params[:id]).call
          end
        end
      end
    end
  end
end
