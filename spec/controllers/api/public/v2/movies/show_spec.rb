require 'rails_helper'

describe API::Public::V2::Movies::Show, type: :request do
  describe 'GET /api/public/v2/movie/' do
    subject { get '/api/public/v2/movie', params: params }

    context 'when valid params' do
      let!(:movie) { create(:movie) }
      let(:params) { { id: movie.id } }

      it "responds with success status" do
        subject
        expect(response).to have_http_status(:ok)
      end

      it "invokes GetMovieByIdQuery" do
        allow_any_instance_of(GetMovieByIdQuery).to receive(:call).and_return(movie)
        expect_any_instance_of(GetMovieByIdQuery).to receive(:call)
        subject
      end
    end

    context 'when invalid params' do
      let(:params) { {} }

      it "responds with bad request status" do
        subject
        expect(response).to have_http_status(:bad_request)
      end

      it 'doesn\'t invoke GetMovieByIdQuery' do
        expect_any_instance_of(GetMovieByIdQuery).to_not receive(:call)
        subject
      end
    end
  end
end
