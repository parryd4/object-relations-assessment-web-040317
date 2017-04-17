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
