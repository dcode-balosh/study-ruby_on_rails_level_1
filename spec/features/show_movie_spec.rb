require 'rails_helper'

describe 'Viewing movie' do
  it 'shows the given movie' do
    movie1 = Movie.create(movie_attributes(total_gross: 3000000))

    visit movie_path(1)

    expect(page).to have_text(movie1.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description)
    expect(page).to have_text(movie1.released_on)
  end

  it "shows the total gross if the total gross exceeds $50M" do
    movie1 = Movie.create(movie_attributes(total_gross: 60000000.00))

    visit movie_path(1)

    expect(page).to have_text("$60,000,000.00")
  end

  it "shows 'Flop!' if the total gross is less than $50M" do
    movie1 = Movie.create(movie_attributes(total_gross: 10.00))

    visit movie_path(1)

    expect(page).to have_text("Flop!")
  end
end
