class Show < ActiveRecord::Base

  def highest_rating
    # this method should return the highest value in the ratings column. *hint*: if there is a `minimum` Active Record method, might there be a `maximum` method?
    self.maximum(:rating)
  end

  def most_popular_show
    # this method should return the show with the highest rating. *hint*: use the `highest_rating` method as a helper method.
    self.where("rating = ?", self.highest_rating).first
  end

  def lowest_rating
    # returns the lowest value in the ratings column.
    self.minimum(:rating)
  end

  def least_popular_show
    # returns the show with the lowest rating.
    self.where("rating = ?", self.lowest_rating).first
  end

  def ratings_sum
    # returns the sum of all of the ratings.
    self.sum(:rating)
  end

  def popular_shows
    # returns an array of all of the shows that have a rating greater than `5`. *hint*: use the `where` Active Record method.
    self.where("rating >= ?", 5)
  end

  def shows_by_alphabetical_order
    # returns an array of all of the shows sorted by alphabetical order according to their names. *hint*: use the `order` Active Record method.
    self.order(:name)
  end

end
