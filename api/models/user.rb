class User
  include DataMapper::Resource

  property :id, Serial
  property :lat, Float# Double? # last_location lat
  property :lng, Float# last_location lng

  property :address, String # btc_address

  # settings
  # remember: (amount / percentage)
  property :amount_cache, Integer # satoshi
  property :percentage, Integer, default: 5 # 5%
  property :respawn_time, Integer, default: 24 # hours
  property :radius, Integer, default: 50 # meters?

  if ENV["RACK_ENV"] == "development"
    def self.test_user
      User.create lat: 10.001, lng: 10
    end

    def self.test_donor
      User.create address: "123as....dx2", lat: 10, lng: 10
    end
  end

  def self.locate_near(lat, lng)
    table = "users"
    # naive, slow approach
    "SELECT id, name,
  6371 * 2 * ASIN(SQRT(POWER(SIN(RADIANS(#{lat} - ABS(#{table}.latitude))), 2) + COS(RADIANS(#{lat})) * COS(RADIANS(ABS(#{table}.latitude))) * POWER(SIN(RADIANS(#{lng} - #{table}.longitude)), 2))) AS distance
    FROM #{table}
    HAVING distance < 10
    ORDER BY distance LIMIT 10;"
  end

  def amount
    # TODO: fetch and update amount_cache
  end

end