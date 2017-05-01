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

def ihash(hash)
  hash.each_pair do |k, v|
    if k == 'track_id'
      p k
      break
    elsif v == 'track_id'
      p v
      break
    elsif v.is_a?(Hash)
      ihash(v)
      if v.has_key?("track_id")
        p v
      end
    end
  end
end

ihash(hash)
#puts track_id
