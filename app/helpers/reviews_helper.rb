module ReviewsHelper
  def format_average_stars(movie)
    average = movie.average_stars
    if average
      '*' * average.round
    else
      content_tag(:strong, 'No reviews')
    end
  end
end
