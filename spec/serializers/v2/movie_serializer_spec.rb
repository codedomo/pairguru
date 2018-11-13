require 'rails_helper'

describe V2::MovieSerializer do
  let!(:genres) { create_list(:genre, 1, :with_movies) }
  let!(:genre) { genres.first }

  let(:result_hash) do
    {
      id: genre.movies.first.id,
      title: genre.movies.first.title,
      genre: {
        id: genre.id,
        name: genre.name,
        movies_count: genre.movies_count,
      }
    }
  end

  subject { described_class.new(genre.movies.first).serializable_hash }

  it { is_expected.to eq(result_hash) }
end
