# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'json'

key = 'apikey=ddaaba14dee2f996db5626c25b66564b'

url = 'http://api.musixmatch.com/ws/1.1/'

song = URI(url + 'track.search?' + key + '&q_artist=laura%20pausini&q_track=la%20solitudine&format=json&page_size=1&has_lyrics=1')
response = Net::HTTP.get(song)
# puts response
hash = JSON.parse(response)

track_id = 0

def ihash(hash)
  hash.each_pair do |k, v|
    v.each do |key, value|
      if key == 'body'
        value.each do |key1, value1|
          value1.each do |i|
            i.each do |key2, value2|
              value2.each do |key3, value3|
                if key3 == 'track_id'
                  return value3
                end
              end
            end
          end
        end
      end
    end
  end
end

track_id = ihash(hash)

p track_id

# p track_id
#puts track_id
