module API
  module Public
    module V1
      class Base < Core
        version "v1", using: :path
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers

        mount Movies::Base
      end
    end
  end
end
