def movie_attributes(overrides = {})
  { title: "Iron Man",
    rating: "PG-13",
    total_gross: 318412101.00,
    description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    cast: "Jack",
    director: "John Sina",
    duration: "1 hour 20 minutes",
    image_file_name: "placeholder.png"
  }.merge(overrides)
end
