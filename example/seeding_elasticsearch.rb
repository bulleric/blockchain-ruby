require 'elasticsearch'
require 'blockchain'
require 'time'
es = Elasticsearch::Client.new log: true

Blockchain::Charts.market_price["values"].each do |data_point|
   es.index index: "bitcoin",
            type:  "market_price",
            body:  {
              :"@timestamp"  => Time.at(data_point["x"]).utc.iso8601,
              :market_price_usd =>  data_point["y"]
            }
end

Blockchain::Charts.total_bitcoins["values"].each do |data_point|
  es.index index: "bitcoin",
            type: "total_bitcoins",
            body:  {
              :"@timestamp"       => Time.at(data_point["x"]).utc.iso8601,
              :total_bitcoins_btc =>  data_point["y"]
            }
end

Blockchain::Charts.n_transactions["values"].each do |data_point|
  es.index index: "bitcoin",
            type: "n_transactions",
            body:  {
              :"@timestamp"   => Time.at(data_point["x"]).utc.iso8601,
              :n_transactions =>  data_point["y"]
            }
end

Blockchain::Charts.hash_rate["values"].each do |data_point|
  es.index index: "bitcoin",
            type: "hash_rate",
            body:  {
              :"@timestamp"  => Time.at(data_point["x"]).utc.iso8601,
              :hash_rate     =>  data_point["y"]
            }
end

