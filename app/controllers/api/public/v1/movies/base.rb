module API
  module Public
    module V1
      module Movies
        class Base < Base
          resource :movies do
            mount Index
          end
        end
      end
    end
  end
end
