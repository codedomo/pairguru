module API
  module Public
    module V1
      module Movies
        class Show < Base
          desc "Return movie by provided id"
          params do
            requires :id, type: Integer
          end
          get serializer: ::V1::MovieSerializer do
            GetMovieByIdQuery.new(params[:id]).call
          end
        end
      end
    end
  end
end
