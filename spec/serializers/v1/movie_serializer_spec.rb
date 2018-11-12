require 'rails_helper'

describe V1::MovieSerializer do
  let(:movie) { create(:movie) }

  let(:result_hash) do
    {
      id: movie.id,
      title: movie.title
    }
  end

  subject { described_class.new(movie).serializable_hash }

  it { is_expected.to eq(result_hash) }
end
