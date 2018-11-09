module MyApi
  class Movie < Base
    property :plot, type: :string
    property :rating, type: :float
    property :poster, type: :string
  end
end
