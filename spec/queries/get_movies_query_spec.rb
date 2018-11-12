require 'rails_helper'

describe GetMoviesQuery do
  let!(:movies) { create_list(:movie, 3) }

  describe '.call' do
    subject { described_class.call }

    it { is_expected.to eq(movies) }
  end
end
