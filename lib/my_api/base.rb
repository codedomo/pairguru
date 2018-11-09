require 'json_api_client'

module MyApi
  class Base < JsonApiClient::Resource
    self.site = "https://pairguru-api.herokuapp.com/api/v1/"
  end
end
