require 'rails_helper'

describe 'Viewing movie' do
  it 'shows the given movie' do
    movie1 = Movie.create(movie_attributes(total_gross: 3000000))

    visit movie_path(1)

    expect(page).to have_text(movie1.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description)
    expect(page).to have_text(movie1.released_on)
    expect(page).to have_text("$3,000,000.00")

  end
end
