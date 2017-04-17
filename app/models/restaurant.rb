
class Restaurant
  attr_accessor :name

  ALL = []

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_name(name)
    self.all.find { |restaurant| restaurant.name == name }
  end

  def reviews
    Review.all.select {|review| review.restaurant == self}
  end

  def customers
    Review.all.collect { |review| review.customer if review.restaurant == self }
  end
end
