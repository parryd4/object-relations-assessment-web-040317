require 'pry'
require_relative 'restaurant.rb'
require_relative 'review.rb'

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
    # add_review was going to shovel new Review into self's and restaurant
    # made Review #initialize responsible for that
  end


    # I thought of adding #reviews and #restaurants as attributes to show has many
    # but thought that might take up too much memory
  def reviews
    Review.all.select {|review| review.customer == self}
  end

  def restaurants
    Review.all.collect { |review| review.restaurant if review.customer == self }
  end

end

buddy = Customer.new("Bob","T")
bfuddy = Customer.new("Timmy","Array")
sd = Customer.new("J","Sil")
Customer.find_by_name("Bob T")
johnnys = Restaurant.new("Johnnys")
buddy.add_review(johnnys, "great pizza!")
binding.pry
puts ""
