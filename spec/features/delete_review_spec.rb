require 'rails_helper'

describe 'Deleting a movie' do
  it 'destroys the movie and shows the movie listing without the deleted movie' do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit movie_reviews_path(movie)

    click_link 'Delete', href: movie_review_path(movie, review)

    expect(current_path).to eq(movie_reviews_path(movie))
    expect(page).not_to have_text(review.name)
    expect(page).to have_text('Review successfully deleted!')
  end
end
