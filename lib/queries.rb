require_relative '../config/environment.rb'

# Who did Jon Stewart have on the Daily Show the most?
def guest_with_most_appearances
  "SELECT
    name,
    count(*) AS total
  FROM guests
  GROUP BY name
  ORDER BY total
    DESC
  LIMIT 1;"
end

# What was the most popular profession of guest for each year Jon Stewart hosted the Daily Show?
def guest_popular_profession_yearly

end

