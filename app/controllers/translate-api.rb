# This program calls the Yandex API to translate song lyrics
# The API detects the language of the lyrics, so any language
# Using the latin alphabet can be used
# The exception is non-ASCII characters, which must be escaped

require 'net/http'
require 'uri'
require 'json'

# Pass the song lyrics from the lyrics controller into here
def translate(lyrics)
  # Create a local object so that the original lyrics object isn't changed
  local_lyrics = lyrics.clone
  # Iterate through each character and look for non-ASCII characters
  # Specifically Italian and Spanish characters
  # Replace them with escape values
  local_lyrics.split('').each do |i|
    if i == ' '
      local_lyrics.sub!(i, '%20')
    elsif i == 'ù'
      local_lyrics.sub!(i, '%0249')
    elsif i == 'Ù'
      local_lyrics.sub!(i, '%0217')
    elsif i == 'À'
      local_lyrics.sub!(i, '%0192')
    elsif i == 'à'
      local_lyrics.sub!(i, '%0224')
    elsif i == 'è'
      local_lyrics.sub!(i, '%0232')
    elsif i == 'È'
      local_lyrics.sub!(i, '%0200')
    elsif i == 'ò'
      local_lyrics.sub!(i, '%0242')
    elsif i == "\'"
      local_lyrics.sub!(i, '%27')
    elsif i == 'ì'
      local_lyrics.sub!(i, '%0236')
    elsif i == 'Ì'
      local_lyrics.sub!(i, '%0204')
    elsif i == 'Ù'
      local_lyrics.sub!(i, '%0217')
    elsif i == 'ù'
      local_lyrics.sub!(i, '%0249')
    elsif i == 'ó'
      local_lyrics.sub!(i, '%0243')
    elsif i == 'Ó'
      local_lyrics.sub!(i, '%0211')
    elsif i == 'á'
      local_lyrics.sub!(i, '%0225')
    elsif i == 'Á'
      local_lyrics.sub!(i, '%0193')
    elsif i == 'é'
      local_lyrics.sub!(i, '%0233')
    elsif i == 'É'
      local_lyrics.sub!(i, '%0201')
    elsif i == 'ú'
      local_lyrics.sub!(i, '%0250')
    elsif i == 'ñ'
      local_lyrics.sub!(i, '%0241')
    end
  end

  # Get the translation and return it
  trans = translations(local_lyrics)
  trans
end

def translations(lyrics)
  # Yandex API Key
  key = 'trnsl.1.1.20170502T140240Z.e335e8f283001e99.9b5c9ad87ddb4e729013b79f9009d8a6b993602f'
  # Yandex API base URL
  url = 'https://translate.yandex.net/api/v1.5/tr.json/'

  # Make an API call to get the translation of the lyrics
  translate = URI(url + 'translate?&key=' + key + '&lang=en&text=' + lyrics + '&options=1')

  get_trans = Net::HTTP.get(translate)

  # Parse the response as JSON
  t = JSON.parse(get_trans)

  translation = ''

  # Iterate through the JSON response to find the translation
  t.each do |key, value|
    if key == 'text'
      translation = value[0]
    end
  end

  # Return the translation
  translation
end
