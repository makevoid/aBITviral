class User
  include DataMapper::Resource


  def self.locate_near(lat, lng)
    table = "users"
    "SELECT id, name,
  6371 * 2 * ASIN(SQRT(POWER(SIN(RADIANS(#{lat} - ABS(#{table}.latitude))), 2) + COS(RADIANS(#{lat})) * COS(RADIANS(ABS(#{table}.latitude))) * POWER(SIN(RADIANS(#{lng} - #{table}.longitude)), 2))) AS distance
    FROM #{table}
    HAVING distance < 10
    ORDER BY distance LIMIT 10;"
  end

end