require 'rails_helper'

describe 'Viewing the list of movies' do
  it 'shows the movies' do
    movie1 = Movie.create(title: "Iron Man",
                          rating: "PG-13",
                          total_gross: 318412101.00,
                          description: "Tony Stark builds an armored suit to fight the throes of evil",
                          released_on: "2008-05-02")

    movie2 = Movie.create(title: "Superman",
                          rating: "PG",
                          total_gross: 134218018.00,
                          description: "Clark Kent grows up to be the greatest super-hero",
                          released_on: "1978-12-15")

    movie3 = Movie.create(title: "Spider-Man",
                          rating: "PG-13",
                          total_gross: 49999999.99,
                          description: "Peter Parker gets bit by a genetically modified spider",
                          released_on: "2002-05-03")

    visit movies_url

    expect(page).to have_text('3 Movies')
    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description[0..10])
    expect(page).to have_text(movie1.released_on)
    expect(page).to have_text("$318,412,101.00")

    expect(page).to have_text("Flop!")

  end

  it 'shows only the released movies' do
    movie1 = Movie.create(movie_attributes(released_on: 2.days.ago))
    movie2 = Movie.create(movie_attributes(title: 'Jack the Jack', released_on: 2.days.from_now))

    visit movies_url

    expect(page).to have_text('1 Movie')
    expect(page).to have_text(movie1.title)
    expect(page).not_to have_text(movie2.title)
  end

  it 'shows movies ordered by release date' do
    movie1 = Movie.create(movie_attributes(released_on: 2.days.ago))
    movie2 = Movie.create(movie_attributes(title: 'Jack the Jack',released_on: 3.days.ago))

    visit movies_url

    expect(movie1.title).to appear_before(movie2.title)
  end
end
