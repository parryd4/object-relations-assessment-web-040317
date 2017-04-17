# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name

  ALL = []

  def self.all
    ALL
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    self.all.find { |cust| cust.full_name == name }
  end

  def self.find_all_by_first_name(first)
    self.all.select { |cust| cust.first_name == first }
  end

  def self.all_names
    self.all.collect {|cust| cust.full_name}
  end

  def add_review(restaurant, content)
    Review.new(restaurant, self, content)
  end

  def reviews
    Review.all.select {|review| review.customer == self}
  end

  def restaurants
    Review.all.collect { |review| review.restaurant if review.customer == self }
  end
end

#

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

#

class Review
  attr_reader :restaurant, :customer, :content
  # #customer and #restaurant covered by attr_readers
  ALL = []

  def initialize(restaurant, customer, content)
      @restaurant = restaurant
      @customer = customer
      @content = content
      # restaurant.reviews << self
      # customer.reviews << self
      ALL << self
  end

  def self.all
    ALL
  end
end
