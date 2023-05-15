class Movie < ApplicationRecord
  # query logic should only be in the models and not views and controllers
  # this is a ruby thing where we define the method on this class

  def self.released
  # the Movie class is the implicit reciever of the where method thus we dont need
  # to do Movie.where(...
  # also placeholder (?) makes sure that the result of Time.now is
  # automatically converted to the proper native database type
    where("released_on > ?", Time.now).order("released_on DESC")
  end

  def self.hit_movies
    # where(total_gross: 300_000_000...).order(total_gross: :desc) => this is equivalent
    where("total_gross >= 300000000").order(total_gross: :desc)
  end

  def self.flop_movies
    # where(total_gross: ...255_000_000).order(total_gross: :asc) => this is equivalent
    where("total_gross <= ?", 255_000_000).order(total_gross: :asc)

  end

  def self.recently_added_movies
    order(created_at: :desc).limit(3)
  end

  # methods that end in question marks always returns a boolean
  # this is an instance class method
  def flop?
    total_gross.blank? || total_gross < 255_000_000
  end
end
