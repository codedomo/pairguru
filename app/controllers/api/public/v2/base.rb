module API
  module Public
    module V2
      class Base < Core
        version "v2", using: :path
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers

        mount Movies::Base
      end
    end
  end
end
