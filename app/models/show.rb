class Show < ActiveRecord::Base
  def self.highest_rating
      self.maximum(:rating)
  end
  def self.most_popular_show
    #ActiveRecord Solution
    #self.where('rating = ?', self.maximum(:rating)).first
    #SQL solution
    self.find_by_sql('SELECT * FROM shows ORDER BY rating DESC LIMIT 1')[0]
  end
  def self.lowest_rating
    self.minimum(:rating)
  end
  def self.least_popular_show
    self.where("rating = ?", self.minimum("rating")).first
  end
  def self.ratings_sum
    self.sum(:rating)
    #self.find_by_sql('SELECT SUM(rating) FROM shows')
    # Cant get the sql statement to work.
    # find_by_sql Doesnt return sum but returns a table row....
  end
  def self.popular_shows
    self.where("rating > 5")
  end
  def self.shows_by_alphabetical_order
    self.order(name: :asc)
  end
end
