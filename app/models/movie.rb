class Movie < ApplicationRecord
  # methods that end in question marks always returns a boolean
  # this is an instance class method
  def flop?
    total_gross.blank? || total_gross < 255_000_000
  end
end
