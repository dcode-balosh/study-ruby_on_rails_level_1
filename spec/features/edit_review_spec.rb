require 'rails_helper'

describe 'Editing a Review' do

  it "updates the review and shows the review's updated details" do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit movie_reviews_path(movie)

    click_link 'Edit', href: edit_movie_review_path(movie, review)

    expect(current_path).to eq(edit_movie_review_path(movie, review))

    expect(find_field('Name').value).to eq(review.name)

    fill_in 'Name', with: 'Updated Review Name'

    click_button 'Post Review'

    expect(current_path).to eq(movie_reviews_path(movie))

    expect(page).to have_text('Updated Review Name')
    expect(page).to have_text('Review successfully updated!')
  end

  it "does not update the movie if it's invalid" do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit edit_movie_review_path(movie,review)

    fill_in 'Name', with: " "

    click_button 'Post Review'

    expect(page).to have_text('error')
  end
end
