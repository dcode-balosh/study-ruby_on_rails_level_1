require 'rails_helper'

describe "A movie" do
  it 'is a flop if the total gross is less than $50M' do
    movie = Movie.new(total_gross: 40000000.00)

    expect(movie.flop?).to eq(true)
  end
  it 'is a not a flop if the total gross exceeds $50M' do
    movie = Movie.new(total_gross: 50000001.00)

    expect(movie.flop?).to eq(false)
  end

  it 'returns only movies released in the past' do
    movie1 = Movie.create(movie_attributes(released_on: 2.days.ago))
    movie2 = Movie.create(movie_attributes(title: 'Jack the Jack',released_on: 2.days.from_now))

    expect(Movie.released).to include(movie1)
    expect(Movie.released).not_to include(movie2)
  end

  it 'released movies ordered with the most recently-released movie first' do
    movie1 = Movie.create(movie_attributes(released_on: 2.days.ago))
    movie2 = Movie.create(movie_attributes(title: 'Jack the Jack',released_on: 3.days.ago))
    expect(Movie.released).to eq([movie1,movie2])

  end
end
