require 'rails_helper'

describe API::Public::V1::Movies::Index, type: :request do
  describe 'GET /api/public/v1/movies' do
    subject { get '/api/public/v1/movies' }

    it "responds with success status" do
      subject
      expect(response).to have_http_status(:ok)
    end

    it "invokes GetMovies" do
      allow(GetMoviesQuery).to receive(:call).and_return(true)
      expect(GetMoviesQuery).to receive(:call)
      subject
    end
  end
end
