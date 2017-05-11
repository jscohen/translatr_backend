# frozen_string_literal: true

# This file gets song lyrics for the artist and title passed
# It cleans the data and then sends an API request to the MusixMatch database
# The result is stored in JSON and iterated through until we can get the lyrics

require 'open-uri'
require 'net/http'
require 'json'

def get_full_lyrics(artist, title)
  # MusixMatch API Key
  key = 'ddaaba14dee2f996db5626c25b66564b'

  # MusixMatch API base URL
  url = 'http://api.musixmatch.com/ws/1.1/'
  # Clean artist data so it can go in a URL
  artist = artist.downcase
  artist_fin = artist.sub(' ', '%20')

  # Clean title data so it can go in a URL
  title = title.downcase
  title_fin = title.sub(' ', '%20')

  # Call the MusixMatch API and store result in song
  song = URI(url + 'track.search?apikey=' + key + '&q_artist=' + artist_fin + '&q_track=' + title_fin + '&format=json&page_size=1&f_has_lyrics=1')
  response = Net::HTTP.get(song)
  # Store the call's result in the hash variable as JSON
  hash = JSON.parse(response)

  # Get the track ID by calling trackhash
  track_id = trackhash(hash)

  track_id = track_id.to_s

  # Using the track ID, make a second API call to get the lyrics
  lyrics = URI(url + 'track.lyrics.get?apikey=' + key + '&track_id=' + track_id + '&page_size=1&format=json')
  getlyrics = Net::HTTP.get(lyrics)

  # Store the result in a JSON hash
  lyricshash = JSON.parse(getlyrics)

  # Return the lyrics
  fin_lyrics = getlyrics(lyricshash)
  p fin_lyrics
  fin_lyrics
end

# Iterate through the hash to get the track ID which we need to get lyrics
# JSON is a hash of hashes, so we have to iterate through each one
# There's probably a better way
# Return the track ID

def getlyrics(lyricshash)
  lyricshash.each_pair do |k, v|
    v.each do |key, value|
      if key == 'body'
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
end

# Iterate through the lyrics hash to get the lyrics like above

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
