path = File.expand_path '../../', __FILE__
APP = "abv_api"

require "bundler/setup"
Bundler.require :default

require "json"


module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

env = ENV["RACK_ENV"] || "development"
# DataMapper.setup :default, "mysql://localhost/abitviral_#{env}"
DataMapper.setup :default, "sqlite://db/abitviral_#{env}.sqlite"
require_all "#{path}/models"
DataMapper.finalize