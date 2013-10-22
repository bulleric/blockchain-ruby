require 'oj'
require 'curb'

module Blockchain
  module Charts
    BASE_URL = "http://blockchain.info/charts"

    # could metaprogram this later (in a later version)

    def total_bitcoins(timespan: "all", format: "json")
      path   = "/total-bitcoins?"
      params = "timespan=#{timespan}&format=#{format}"
      c = Curl::Easy.perform(BASE_URL + path + params)
      response = c.body_str
      response
    end

    def market_price(timespan: "all", format: "json")
      path   = "/market-price?"
      params = "timespan=#{timespan}&format=#{format}"
      c = Curl::Easy.perform(BASE_URL + path + params)
      response = c.body_str
      response
    end

    def n_transactions(timespan: "all", format: "json")
      path   = "/n-transactions?"
      params = "timespan=#{timespan}&format=#{format}"
      c = Curl::Easy.perform(BASE_URL + path + params)
      response = c.body_str
      response 
    end

    extend self
  end
end


