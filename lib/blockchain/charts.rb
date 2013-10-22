require 'oj'
require 'curb'

module Blockchain
  module Charts
    BASE_URL = "http://blockchain.info/charts"

    # example usage
    # Blockchain::Charts.total_bitcoins
    # Blockchain::Charts.market_price
    # Blockchain::Charts.n_transactions

    def api_call(url_path)
      c = Curl::Easy.perform(BASE_URL + url_path)
      response = c.body_str
      Oj.load(response)
    end

    def method_missing(name, *args, &block)
      if args.empty?
        args = {"timespan" => "all", "format" => "json"}
      else
        args = args[0]
      end
      path = "/#{name.to_s.gsub!("_", "-")}"
      query = args.map { |e| e.join("=") }.join("&")
      api_call("#{path}?#{query}")
    end

    extend self

  end
end

