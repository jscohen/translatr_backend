# frozen_string_literal: true

require 'open-uri'
require 'net/http'
require 'json'

def get_full_lyrics(artist, title)
  key = 'apikey=ddaaba14dee2f996db5626c25b66564b'

  url = 'http://api.musixmatch.com/ws/1.1/'

  artist.downcase!
  artist_fin = artist.sub(' ', '%20')

  title.downcase!
  title_fin = title.sub(' ', '%20')

  song = URI(url + 'track.search?' + key + '&q_artist=' + artist_fin + '&q_track=' + title_fin + '&format=json&page_size=1&has_lyrics=1')
  response = Net::HTTP.get(song)
  # puts response
  hash = JSON.parse(response)

  track_id = 0

  def trackhash(hash)
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

  track_id = trackhash(hash)

  p track_id

  track_id = track_id.to_s

  lyrics = URI(url + 'track.lyrics.get?' + key + '&track_id=' + track_id)

  getlyrics = Net::HTTP.get(lyrics)

  lyricshash = JSON.parse(getlyrics)

  def getlyrics(lyricshash)
    lyricshash.each_pair do |k, v|
      v.each do |key, value|
        value.each do |key1, value1|
          if value1.is_a?(Hash)
            value1.each do |key2, value2|
              if key2 == 'lyrics_body'
                return value2
              end
            end
          end
        end
      end
    end
  end

  fin_lyrics = getlyrics(lyricshash)
  fin_lyrics
end
#puts track_id
