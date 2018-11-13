module API
  module Public
    class Core < Grape::API
      prefix "api/public"
      mount API::Public::V1::Base
      mount API::Public::V2::Base
    end
  end
end
