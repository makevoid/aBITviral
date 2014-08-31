path = File.expand_path '../', __FILE__

require "#{path}/config/env.rb"

class AbvApi < Sinatra::Base

  # routes

  before do
    content_type :json
    response.headers["Access-Control-Allow-Origin"] = "*"
  end

  after do
    response.body = response.body.to_json
  end

  get "/" do
    { message: "aBitViral's main api: please refer to the documentation you can find on: https://github.com/makevoid/aBitViral" }
  end

  get "/test" do
    { message: true }
  end

  get "/generate_address" do
    params["account"]

    address = "1abc..def"

    { address: address }
  end

  post "/login" do
    { message: "problem logging in", error: true }
    { message: true }
  end


end
