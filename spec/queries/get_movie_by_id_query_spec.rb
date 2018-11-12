require 'rails_helper'

describe GetMovieByIdQuery do
  let!(:movie) { create(:movie) }

  describe '#call' do
    subject { described_class.new(movie.id).call }

    it { is_expected.to eq movie }
  end
end
